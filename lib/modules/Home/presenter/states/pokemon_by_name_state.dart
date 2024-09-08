import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';

abstract class PokemonByNameState {}

class PokemonByNameLoadingState extends PokemonByNameState {}

class PokemonByNameSuccessState extends PokemonByNameState {
  final PokemonDetailsModel pokemons;
  PokemonByNameSuccessState(this.pokemons);
}

class PokemonByNameErrorState extends PokemonByNameState {
  final String message;
  PokemonByNameErrorState(this.message);
}
