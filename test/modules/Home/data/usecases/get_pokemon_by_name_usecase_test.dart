import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemon_by_name.dart';

import '../../../../mocks/home_mocks.mocks.dart';

void main() {
  late GetPokemonByNameUsecase usecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetPokemonByNameUsecaseImp(homeRepository: mockHomeRepository);
  });

  final name = "pikachu";

  group("Get Pokemon By Name Usecase", () {
    test(
        'should return a PokemonDetailsModel when  repository call getPokemonByName and is successful',
        () async {
      final pokemonsDetails = PokemonDetailsModel(
        id: 1,
        name: "pikachu",
        baseExperience: 10,
        height: 10,
      );

      when(mockHomeRepository.getPokemonByName(name: name))
          .thenAnswer((_) async => pokemonsDetails);

      final result = await usecase.getPokemonByName(name: name);

      expect(result, isA<PokemonDetailsModel>());
      expect(result.name, "pikachu");

      verify(mockHomeRepository.getPokemonByName(name: name)).called(1);
    });

    test(
        'should throw an exception when repository call getPokemonByName  and it fails',
        () async {
      when(mockHomeRepository.getPokemonByName(name: name))
          .thenThrow(Exception('Failed to fetch pokemons'));

      expect(() => usecase.getPokemonByName(name: name), throwsException);

      verify(mockHomeRepository.getPokemonByName(name: name)).called(1);
    });
  });
}
