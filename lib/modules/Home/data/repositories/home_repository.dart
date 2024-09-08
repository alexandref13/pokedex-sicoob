import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

abstract class HomeRepository {
  Future<List<PokemonModel>> getPokemons({int? page});

  Future<PokemonDetailsModel> getPokemonByName({required String name});
}
