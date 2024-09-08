import 'package:pokedex_sicoob/modules/Details/domain/models/pokemon_details_model.dart';

abstract class PokemonDetailsState {}

class PokemonDetailsLoadingState extends PokemonDetailsState {}

class PokemonDetailsSuccessState extends PokemonDetailsState {
  final PokemonDetailsModel pokemon;
  PokemonDetailsSuccessState(this.pokemon);
}

class PokemonDetailsErrorState extends PokemonDetailsState {
  final String message;
  PokemonDetailsErrorState(this.message);
}
