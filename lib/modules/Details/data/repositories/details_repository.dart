import 'package:pokedex_sicoob/modules/Details/domain/models/pokemon_details_model.dart';

abstract class DetailsRepository {
  Future<PokemonDetailsModel> getPokemonsDetails({required String id});
}
