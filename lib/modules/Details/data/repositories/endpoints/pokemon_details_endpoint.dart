import 'package:pokedex_sicoob/core/config/contants.dart';

class PokemonsDetailsEndpoint {
  static Uri getPokemonDetails(String id) => Uri.https(
        BASE_URL,
        '/api/v2/pokemon/${id}',
      );
}
