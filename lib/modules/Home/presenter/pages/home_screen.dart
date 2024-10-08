import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_sicoob/core/widgets/loading_widget.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_by_name_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/store/home_store.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/widgets/pokemon_box_search_widget.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/widgets/pokemon_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeStore store = GetIt.instance();

  @override
  void initState() {
    store.fetchPokemons();
    store.scrollController.addListener(store.scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    store.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex Sicoob"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: PokemonBoxSearchWidget(),
          ),
          Observer(
            builder: (context) {
              var pokemonState = store.pokemonState;

              if (pokemonState is PokemonErrorState) {
                return Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Text(pokemonState.message),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await store.fetchPokemons();
                        },
                        child: const Text("Buscar novamente Pokemons"),
                      )
                    ],
                  ),
                );
              }

              if (pokemonState is PokemonSuccessState) {
                return Expanded(
                  child: GridView.builder(
                    controller: store.scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemCount: pokemonState.pokemons.length,
                    itemBuilder: (context, index) {
                      var pokemon = pokemonState.pokemons[index];
                      return PokemonItemWidget(pokemon: pokemon);
                    },
                  ),
                );
              }

              if (store.pokemonByNameState is PokemonByNameLoadingState) {
                return const LoadingWidget();
              }

              return const LoadingWidget();
            },
          ),
        ],
      ),
    );
  }
}
