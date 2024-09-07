import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

abstract class GetPokemonsUsecase {
  Future<List<PokemonModel>> getPokemons();
}

class GetPokemonsUsecaseImp implements GetPokemonsUsecase {
  final HomeRepository homeRepository;

  GetPokemonsUsecaseImp({required this.homeRepository});

  @override
  Future<List<PokemonModel>> getPokemons() async {
    try {
      return await homeRepository.getPokemons();
    } catch (e) {
      rethrow;
    }
  }
}
