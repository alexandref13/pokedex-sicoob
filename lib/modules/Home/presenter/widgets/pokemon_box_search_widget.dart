import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_sicoob/core/extensions/navigation_extensions.dart';
import 'package:pokedex_sicoob/core/utils/show_dialog.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/states/pokemon_by_name_state.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/store/home_store.dart';

class PokemonBoxSearchWidget extends StatelessWidget {
  const PokemonBoxSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = GetIt.instance();

    return Row(
      children: [
        Expanded(
          child: Observer(
            builder: (context) {
              return TextField(
                controller:
                    TextEditingController(text: homeStore.pokemonNameSearch),
                onChanged: homeStore.setPokemonNameSearch,
                decoration: InputDecoration(
                  labelText: 'Nome do pokemon',
                  border: OutlineInputBorder(),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 8),
        Observer(
          builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                await homeStore.handlePokemonByName(
                    name: homeStore.pokemonNameSearch);

                if (homeStore.pokemonByNameState is PokemonByNameSuccessState) {
                  context.pushNamed(
                    '/details',
                    arguments: (homeStore.pokemonByNameState
                            as PokemonByNameSuccessState)
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
            );
          },
        )
      ],
    );
  }
}
