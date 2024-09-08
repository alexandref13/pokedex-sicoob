import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

abstract class GetPokemonsUsecase {
  Future<List<PokemonModel>> getPokemons({int? page});
}

class GetPokemonsUsecaseImp implements GetPokemonsUsecase {
  final HomeRepository homeRepository;

  GetPokemonsUsecaseImp({required this.homeRepository});

  @override
  Future<List<PokemonModel>> getPokemons({int? page}) async {
    try {
      return await homeRepository.getPokemons(page: page);
    } catch (e) {
      rethrow;
    }
  }
}
