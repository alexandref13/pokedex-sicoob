import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:pokedex_sicoob/modules/Details/data/repositories/details_repository.dart';
import 'package:pokedex_sicoob/modules/Details/data/repositories/details_repository_imp.dart';
import 'package:pokedex_sicoob/modules/Details/domain/models/pokemon_details_model.dart';

import '../../../../mocks/home_mocks.mocks.dart';

void main() {
  group('DetailsRepositoryImp', () {
    late DetailsRepository repository;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      repository = DetailsRepositoryImp(client: mockClient);
    });

    final id = "1";

    test('should return a PokemonDetailsModel when the response code is 200',
        () async {
      final jsonResponse = jsonEncode({
        {
          "id": 1,
          "name": "pikachu",
          "base_experience": 10,
          "height": 10,
        },
      });

      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(jsonResponse, 200));

      final result = await repository.getPokemonsDetails(id: id);

      expect(result, isA<PokemonDetailsModel>());

      expect(result.name, "pikachu");

      verify(mockClient.get(any)).called(1);
    });

    test('should throw an exception when the response code is not 200',
        () async {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Error', 404));

      expect(() => repository.getPokemonsDetails(id: id), throwsException);

      verify(mockClient.get(any)).called(1);
    });
  });
}
