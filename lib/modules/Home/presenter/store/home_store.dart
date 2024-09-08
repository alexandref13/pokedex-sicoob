import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemons_usecase.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_state.dart';

part 'home_store.g.dart';

// NOTE -> Aqui eu fiquei na duvida entre usar ou nao usar os packages: mobx_codegen, build_runner e flutter_mobx
// NOTE -> Mas aqui usei pelo fato de estar na documentaçao oficial do Mobx para fazer uso do mobx_codegen

class HomeStoreImp = HomeStore with _$HomeStoreImp;

abstract class HomeStore with Store {
  GetPokemonsUsecase getPokemonsUseCase;

  HomeStore({
    required this.getPokemonsUseCase,
  });

  ScrollController scrollController = ScrollController();
  int page = 1;

  @observable
  PokemonState pokemonState = PokemonLoadingState();

  @action
  Future<void> fetchPokemons() async {
    try {
      pokemonState = PokemonLoadingState();

      final response = await getPokemonsUseCase.getPokemons();

      pokemonState = PokemonSuccessState(response);
    } catch (e) {
      print(e);
      pokemonState = PokemonErrorState(
        "Algo deu errado na solicitação, tente novamente mais tarde! $e",
      );
    }
  }

  @action
  Future<void> fetchMorePokemons({required int page}) async {
    try {
      final response = await getPokemonsUseCase.getPokemons(page: page);

      final firstsPokemons = (pokemonState as PokemonSuccessState).pokemons;

      pokemonState = PokemonSuccessState([
        ...firstsPokemons,
        ...response,
      ]);
    } catch (e) {
      print(e);
      pokemonState = PokemonErrorState(
        "Algo deu errado na solicitação, tente novamente mais tarde! $e",
      );
    }
  }

  Future<void> scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await fetchMorePokemons(page: ++page);
    }
  }
}
