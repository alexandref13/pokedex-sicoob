import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_sicoob/core/extensions/navigation_extensions.dart';
import 'package:pokedex_sicoob/core/utils/show_dialog.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_by_name_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/store/home_store.dart';

class PokemonBoxSearchWidget extends StatefulWidget {
  const PokemonBoxSearchWidget({
    super.key,
  });

  @override
  State<PokemonBoxSearchWidget> createState() => _PokemonBoxSearchWidgetState();
}

class _PokemonBoxSearchWidgetState extends State<PokemonBoxSearchWidget> {
  HomeStore homeStore = GetIt.instance();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: homeStore.pokemonNameController,
            onChanged: (String value) {
              homeStore.pokemonNameController.text = value;
            },
            autocorrect: false,
            decoration: InputDecoration(
              labelText: 'Nome do pokemon',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () async {
            if (homeStore.pokemonNameController.text.isEmpty) {
              return;
            }

            await homeStore.handlePokemonByName(
              name: homeStore.pokemonNameController.text,
            );

            if (homeStore.pokemonByNameState is PokemonByNameSuccessState) {
              context.pushNamed(
                '/details',
                arguments:
                    (homeStore.pokemonByNameState as PokemonByNameSuccessState)
                        .pokemons,
              );
            }

            if (homeStore.pokemonByNameState is PokemonByNameErrorState) {
              showAlertDialog(context);
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // BorderRadius de 8
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Icon(Icons.search),
        ),
      ],
    );
  }
}
