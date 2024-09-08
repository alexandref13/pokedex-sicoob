import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository_imp.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

import '../../../../mocks/home_mocks.mocks.dart';

void main() {
  group('HomeRepositoryImp', () {
    late HomeRepositoryImp repository;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      repository = HomeRepositoryImp(client: mockClient);
    });

    test('should return a list of PokemonModel when the response code is 200',
        () async {
      final jsonResponse = jsonEncode({
        "results": [
          {"name": "pikachu", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
          {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/2/"}
        ]
      });

      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(jsonResponse, 200));

      final result = await repository.getPokemons();

      expect(result, isA<List<PokemonModel>>());

      expect(result.length, 2);
      expect(result[0].name, 'pikachu');
      expect(result[0].url, 'https://pokeapi.co/api/v2/pokemon/1/');

      verify(mockClient.get(any)).called(1);
    });

    test('should throw an exception when the response code is not 200',
        () async {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => repository.getPokemons(), throwsException);

      verify(mockClient.get(any)).called(1);
    });
  });
}
