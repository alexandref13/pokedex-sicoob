import 'package:pokedex_sicoob/core/config/contants.dart';

class PokemonsEndpoint {
  static Uri getPokemon(int? page) {
    var offset = 0;

    if (page != null) {
      offset = (page - 1) * 20;
    }

    return Uri.https(BASE_URL, '/api/v2/pokemon', {
      "offset": offset.toString(),
      "limit": "20",
    });
  }
}
