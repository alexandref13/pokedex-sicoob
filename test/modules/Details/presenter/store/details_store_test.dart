import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/store/home_store.dart';

import '../../../../mocks/home_mocks.mocks.dart';

void main() {
  late MockGetPokemonsUsecase mockGetPokemonsUsecase;
  late HomeStore homeStore;

  setUp(() {
    mockGetPokemonsUsecase = MockGetPokemonsUsecase();
    homeStore = HomeStoreImp(getPokemonsUseCase: mockGetPokemonsUsecase);
  });

  test('should start with PokemonLoadingState', () {
    expect(homeStore.pokemonState, isA<PokemonLoadingState>());
  });

  test('should return pokemons when fetchPokemons is successful', () async {
    final pokemons = [
      PokemonModel(
          name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      PokemonModel(
          name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/2/')
    ];

    when(mockGetPokemonsUsecase.getPokemons())
        .thenAnswer((_) async => pokemons);

    final result = homeStore.fetchPokemons();

    expect(homeStore.pokemonState, isA<PokemonLoadingState>());

    await result;

    expect(homeStore.pokemonState, isA<PokemonSuccessState>());

    final successState = homeStore.pokemonState as PokemonSuccessState;

    expect(successState.pokemons.length, 2);
    expect(successState.pokemons[0].name, 'pikachu');
    expect(successState.pokemons[0].id, '1');

    verify(mockGetPokemonsUsecase.getPokemons()).called(1);
  });

  test('should set PokemonErrorState when fetchPokemons throws an error',
      () async {
    when(mockGetPokemonsUsecase.getPokemons())
        .thenThrow(Exception('Failed to fetch'));

    final result = homeStore.fetchPokemons();

    expect(homeStore.pokemonState, isA<PokemonLoadingState>());

    await result;

    expect(homeStore.pokemonState, isA<PokemonErrorState>());

    final errorState = homeStore.pokemonState as PokemonErrorState;

    expect(errorState.message, contains('Algo deu errado na solicitação'));
  });
}
