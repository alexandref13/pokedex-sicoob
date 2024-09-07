import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

abstract class HomeRepository {
  Future<List<PokemonModel>> getPokemons();
  Future<List<dynamic>> getPokemonsDetails();
}
