import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/core/extensions/navigation_extensions.dart';
import 'package:pokedex_sicoob/core/extensions/string_extensions.dart';
import 'package:pokedex_sicoob/core/service/pokemon_platform_channel.dart';
import 'package:pokedex_sicoob/core/widgets/loading_widget.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/states/pokemon_details_state.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/store/details_store.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/widgets/details_pokemon_image_widget.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/widgets/details_pokemon_info_widget.dart';

class DetailsScreen extends StatefulWidget {
  final String? pokemonId;
  const DetailsScreen({
    super.key,
    this.pokemonId,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsStore store = GetIt.instance();
  PokemonPlatformChannel pokemonPlatformChannel = GetIt.instance();

  var result = "";

  @override
  void initState() {
    if (widget.pokemonId != null) {
      store.fetchPokemonById(id: widget.pokemonId!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = context.getArguments();

    if (pokemon != null) {
      store.pokemonState =
          PokemonDetailsSuccessState(pokemon as PokemonDetailsModel);
    }

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
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      result = await pokemonPlatformChannel.getBatteryLevel();

                      setState(() {});
                    },
                    child: Text("Busque a bateria"),
                  ),
                  Text(
                    result,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30)
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
