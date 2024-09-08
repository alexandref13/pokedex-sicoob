import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_by_name_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/store/home_store.dart';

import '../../../../mocks/home_mocks.mocks.dart';

void main() {
  late MockGetPokemonsUsecase mockGetPokemonsUsecase;
  late MockGetPokemonByNameUsecase mockGetPokemonByNameUsecase;
  late HomeStore homeStore;

  setUp(() {
    mockGetPokemonsUsecase = MockGetPokemonsUsecase();
    mockGetPokemonByNameUsecase = MockGetPokemonByNameUsecase();
    homeStore = HomeStoreImp(
      getPokemonsUseCase: mockGetPokemonsUsecase,
      getPokemonByNameUsecase: mockGetPokemonByNameUsecase,
    );
  });

  group("Home Store", () {
    final name = "pikachu";

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

      expect(homeStore.pokemonState, isA<PokemonLoadingState>());

      final result = homeStore.fetchPokemons();

      await result;

      expect(homeStore.pokemonState, isA<PokemonErrorState>());

      final errorState = homeStore.pokemonState as PokemonErrorState;

      expect(errorState.message, contains('Algo deu errado na solicitação'));
    });

    test(
      "should return a list of pokemons from fetchPokemons and from fetchMorePokemons when is successful",
      () async {
        final firstPokemons = [
          PokemonModel(
              name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
          PokemonModel(
              name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/2/')
        ];

        when(mockGetPokemonsUsecase.getPokemons())
            .thenAnswer((_) async => firstPokemons);

        final result = homeStore.fetchPokemons();

        await result;

        final morePokemons = [
          PokemonModel(
              name: 'charmander', url: 'https://pokeapi.co/api/v2/pokemon/3/'),
          PokemonModel(
              name: 'charizard', url: 'https://pokeapi.co/api/v2/pokemon/4/')
        ];

        when(mockGetPokemonsUsecase.getPokemons(page: 2))
            .thenAnswer((_) async => morePokemons);

        final secondResult = homeStore.fetchMorePokemons(page: 2);

        await secondResult;

        expect(homeStore.pokemonState, isA<PokemonSuccessState>());

        final successState = homeStore.pokemonState as PokemonSuccessState;

        expect(successState.pokemons.length, 4);
        expect(successState.pokemons[0].name, 'pikachu');
        expect(successState.pokemons[0].id, '1');
        expect(successState.pokemons[2].name, 'charmander');
        expect(successState.pokemons[2].id, '3');

        verify(mockGetPokemonsUsecase.getPokemons()).called(1);
        verify(mockGetPokemonsUsecase.getPokemons(page: 2)).called(1);
      },
    );

    test('should set PokemonErrorState when fetchMorePokemons throws an error',
        () async {
      final pokemons = [
        PokemonModel(
            name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
        PokemonModel(
            name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/2/')
      ];

      when(mockGetPokemonsUsecase.getPokemons())
          .thenAnswer((_) async => pokemons);

      final result = homeStore.fetchPokemons();

      await result;

      when(mockGetPokemonsUsecase.getPokemons(page: 2)).thenThrow(
        Exception('Failed to fetch'),
      );

      final secondResult = homeStore.fetchMorePokemons(page: 2);

      await secondResult;

      expect(homeStore.pokemonState, isA<PokemonErrorState>());

      final errorState = homeStore.pokemonState as PokemonErrorState;

      expect(errorState.message, contains('Algo deu errado na solicitação'));
    });

    test('should return a pokemon when handlePokemonByName is successful',
        () async {
      final pokemonByName = PokemonDetailsModel(
        id: 1,
        name: "pikachu",
        baseExperience: 10,
        height: 10,
      );

      when(mockGetPokemonByNameUsecase.getPokemonByName(name: name)).thenAnswer(
        (_) async => pokemonByName,
      );

      final result = homeStore.handlePokemonByName(name: name);

      expect(homeStore.pokemonByNameState, isA<PokemonByNameLoadingState>());

      await result;

      expect(homeStore.pokemonByNameState, isA<PokemonByNameSuccessState>());

      final successState =
          homeStore.pokemonByNameState as PokemonByNameSuccessState;

      expect(successState.pokemons.id, 1);
      expect(successState.pokemons.name, "pikachu");

      verify(mockGetPokemonByNameUsecase.getPokemonByName(name: name))
          .called(1);
    });

    test(
        'should set PokemonByNameErrorState when handlePokemonByName throws an error',
        () async {
      when(mockGetPokemonByNameUsecase.getPokemonByName(name: name))
          .thenThrow(Exception('Failed to fetch'));

      expect(homeStore.pokemonByNameState, isA<PokemonByNameLoadingState>());

      final result = homeStore.handlePokemonByName(name: name);

      await result;

      expect(homeStore.pokemonByNameState, isA<PokemonByNameErrorState>());

      final errorState =
          homeStore.pokemonByNameState as PokemonByNameErrorState;

      expect(errorState.message, contains('Algo deu errado na solicitação'));
    });
  });
}
