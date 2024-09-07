import 'package:pokedex_sicoob/core/config/contants.dart';

class PokemonsEndpoint {
  static Uri getPokemon() => Uri.https(
        BASE_URL,
        '/api/v2/pokemon',
      );
}
