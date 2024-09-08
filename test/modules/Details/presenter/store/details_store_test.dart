import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/states/pokemon_details_state.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/store/details_store.dart';

import '../../../../mocks/details_mocks.mocks.dart';

void main() {
  late MockGetPokemonDetailsUsecase mockGetPokemonDetailsUsecase;
  late MockPokemonPlatformChannel mockPokemonPlatformChannel;
  late DetailsStore detailsStore;

  setUp(() {
    mockGetPokemonDetailsUsecase = MockGetPokemonDetailsUsecase();
    mockPokemonPlatformChannel = MockPokemonPlatformChannel();
    detailsStore = DetailsStoreImp(
      getPokemonDetailsUsecase: mockGetPokemonDetailsUsecase,
      pokemonPlatformChannel: mockPokemonPlatformChannel,
    );
  });

  final id = "1";

  group("DetailsStore", () {
    test('should start with PokemonDetailsLoadingState', () {
      expect(detailsStore.pokemonState, isA<PokemonDetailsLoadingState>());
    });

    test('should return pokemon detail when fetchPokemonById is successful',
        () async {
      final pokemonDetails = PokemonDetailsModel(
        id: 1,
        name: "pikachu",
        baseExperience: 10,
        height: 10,
        weight: 10,
      );

      when(mockGetPokemonDetailsUsecase.getPokemonDetails(id: id)).thenAnswer(
        (_) async => pokemonDetails,
      );

      final result = detailsStore.fetchPokemonById(id: id);

      expect(detailsStore.pokemonState, isA<PokemonDetailsLoadingState>());

      await result;

      expect(detailsStore.pokemonState, isA<PokemonDetailsSuccessState>());

      final successState =
          detailsStore.pokemonState as PokemonDetailsSuccessState;

      expect(successState.pokemon.id, 1);
      expect(successState.pokemon.name, "pikachu");

      verify(mockGetPokemonDetailsUsecase.getPokemonDetails(id: id)).called(1);
    });

    test('should set PokemonErrorState when fetchPokemons throws an error',
        () async {
      when(mockGetPokemonDetailsUsecase.getPokemonDetails(id: id))
          .thenThrow(Exception('Failed to fetch'));

      expect(detailsStore.pokemonState, isA<PokemonDetailsLoadingState>());

      final result = detailsStore.fetchPokemonById(id: id);

      await result;

      expect(detailsStore.pokemonState, isA<PokemonDetailsErrorState>());

      final errorState = detailsStore.pokemonState as PokemonDetailsErrorState;

      expect(errorState.message, contains('Algo deu errado na solicitação'));
    });
  });
}
