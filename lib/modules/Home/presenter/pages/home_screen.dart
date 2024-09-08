import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_sicoob/core/widgets/loading_widget.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/store/home_store.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex Sicoob"),
      ),
      body: Observer(builder: (context) {
        var pokemonState = store.pokemonState;

        if (pokemonState is PokemonErrorState) {
          return Column(
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
          );
        }

        if (pokemonState is PokemonSuccessState) {
          return GridView.builder(
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
          );
        }

        return const LoadingWidget();
      }),
    );
  }
}
