import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemons_usecase.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

import '../../../../mocks/home_mocks.mocks.dart';

void main() {
  late GetPokemonsUsecaseImp usecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetPokemonsUsecaseImp(homeRepository: mockHomeRepository);
  });

  test(
      'should return a list of PokemonModel when repository call is successful',
      () async {
    final pokemons = [
      PokemonModel(
          name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      PokemonModel(
          name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/2/')
    ];

    when(mockHomeRepository.getPokemons()).thenAnswer((_) async => pokemons);

    final result = await usecase.getPokemons();

    expect(result, isA<List<PokemonModel>>());
    expect(result.length, 2);
    expect(result[0].name, 'pikachu');
    expect(result[1].name, 'bulbasaur');

    verify(mockHomeRepository.getPokemons()).called(1);
  });

  test('should throw an exception when repository call fails', () async {
    when(mockHomeRepository.getPokemons())
        .thenThrow(Exception('Failed to fetch pokemons'));

    expect(() => usecase.getPokemons(), throwsException);

    verify(mockHomeRepository.getPokemons()).called(1);
  });
}
