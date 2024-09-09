import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_sicoob/core/domain/exceptions/server_exception.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemon_by_name.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemons_usecase.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_by_name_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_state.dart';

part 'home_store.g.dart';

// NOTE -> Aqui eu fiquei na duvida entre usar ou nao usar os packages: mobx_codegen, build_runner e flutter_mobx
// NOTE -> Mas aqui usei pelo fato de estar na documentaçao oficial do Mobx para fazer uso do mobx_codegen

class HomeStoreImp = HomeStore with _$HomeStoreImp;

abstract class HomeStore with Store {
  GetPokemonsUsecase getPokemonsUseCase;
  GetPokemonByNameUsecase getPokemonByNameUsecase;

  HomeStore({
    required this.getPokemonsUseCase,
    required this.getPokemonByNameUsecase,
  });

  TextEditingController pokemonNameController = TextEditingController();
  ScrollController scrollController = ScrollController();
  int page = 1;

  @observable
  PokemonState pokemonState = PokemonLoadingState();

  @observable
  PokemonByNameState pokemonByNameState = PokemonByNameLoadingState();

  @action
  Future<void> fetchPokemons() async {
    try {
      pokemonState = PokemonLoadingState();

      final response = await getPokemonsUseCase.getPokemons();

      pokemonState = PokemonSuccessState(response);
    } on ServerException catch (e) {
      pokemonState = PokemonErrorState(
        e.message,
      );
    } catch (e) {
      pokemonState = PokemonErrorState(
        "Erro desconhecido, sentimos muito",
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
    } on ServerException catch (e) {
      pokemonState = PokemonErrorState(
        e.message,
      );
    } catch (e) {
      pokemonState = PokemonErrorState(
        "Erro desconhecido, sentimos muito",
      );
    }
  }

  @action
  Future<void> handlePokemonByName({required String name}) async {
    try {
      pokemonByNameState = PokemonByNameLoadingState();

      final response = await getPokemonByNameUsecase.getPokemonByName(
        name: name.toLowerCase().trim(),
      );

      pokemonByNameState = PokemonByNameSuccessState(response);
    } on ServerException catch (e) {
      pokemonByNameState = PokemonByNameErrorState(
        e.message,
      );
    } catch (e) {
      pokemonByNameState = PokemonByNameErrorState(
        "Erro desconhecido, sentimos muito",
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
