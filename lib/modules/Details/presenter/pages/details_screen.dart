import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_sicoob/core/extensions/string_extensions.dart';
import 'package:pokedex_sicoob/core/widgets/loading_widget.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/states/pokemon_details_state.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/store/details_store.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/widgets/details_pokemon_image_widget.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/widgets/details_pokemon_info_widget.dart';

class DetailsScreen extends StatefulWidget {
  final String pokemonId;
  const DetailsScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsStore store = GetIt.instance();

  @override
  void initState() {
    store.fetchPokemonById(id: widget.pokemonId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (context) {
            final pokemonState = store.pokemonState;
            if (pokemonState is PokemonDetailsSuccessState) {
              return Text(pokemonState.pokemon.name.capitalize());
            }

            return SizedBox.shrink();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Observer(
          builder: (context) {
            final pokemonState = store.pokemonState;

            if (pokemonState is PokemonDetailsErrorState) {
              return Center(
                child: Text(pokemonState.message),
              );
            }

            if (pokemonState is PokemonDetailsSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailsPokemonImageWidget(pokemon: pokemonState.pokemon),
                  Expanded(
                    child: DetailsPokemonInfoWidget(
                      pokemon: pokemonState.pokemon,
                    ),
                  ),
                ],
              );
            }

            return LoadingWidget();
          },
        ),
      ),
    );
  }
}
