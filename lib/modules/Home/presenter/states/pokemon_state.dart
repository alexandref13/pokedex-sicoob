import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

abstract class PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonSuccessState extends PokemonState {
  final List<PokemonModel> pokemons;
  PokemonSuccessState(this.pokemons);
}

class PokemonErrorState extends PokemonState {
  final String message;
  PokemonErrorState(this.message);
}
