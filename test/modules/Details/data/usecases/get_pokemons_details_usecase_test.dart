import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_sicoob/modules/Details/data/use_cases/get_pokemon_details_usecase.dart';
import 'package:pokedex_sicoob/modules/Details/domain/models/pokemon_details_model.dart';

import '../../../../mocks/details_mocks.mocks.dart';

void main() {
  late GetPokemonDetailsUsecase usecase;
  late MockDetailsRepository mockDetailsRepository;

  setUp(() {
    mockDetailsRepository = MockDetailsRepository();
    usecase =
        GetPokemonDetailsUsecaseImp(detailsRepository: mockDetailsRepository);
  });

  group("PokemonDetailsUsecase", () {
    final id = "1";

    test(
        'should return a PokemonDetailsModel when repository call is successful',
        () async {
      final pokemonsDetails = PokemonDetailsModel(
        id: 1,
        name: "pikachu",
        baseExperience: 10,
        height: 10,
      );

      when(mockDetailsRepository.getPokemonsDetails(id: id))
          .thenAnswer((_) async => pokemonsDetails);

      final result = await usecase.getPokemonDetails(id: id);

      expect(result, isA<PokemonDetailsModel>());

      expect(result.name, "pikachu");

      verify(mockDetailsRepository.getPokemonsDetails(id: id)).called(1);
    });

    test('should throw an exception when repository call fails', () async {
      when(mockDetailsRepository.getPokemonsDetails(
        id: id,
      )).thenThrow(Exception('Failed to fetch pokemons'));

      expect(
          () => usecase.getPokemonDetails(
                id: id,
              ),
          throwsException);

      verify(mockDetailsRepository.getPokemonsDetails(
        id: id,
      )).called(1);
    });
  });
}
