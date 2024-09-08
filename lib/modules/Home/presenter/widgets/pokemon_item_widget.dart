import 'package:flutter/material.dart';
import 'package:pokedex_sicoob/core/extensions/navigation_extensions.dart';
import 'package:pokedex_sicoob/core/extensions/string_extensions.dart';
import 'package:pokedex_sicoob/core/widgets/custom_cached_image_widget.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/pages/details_screen.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

class PokemonItemWidget extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonItemWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTo(
          DetailsScreen(pokemonId: pokemon.id),
        );
      },
      child: Card(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              child: Hero(
                tag: "pokemon-${pokemon.id}",
                child: CustomCachedImageWidget(
                  url: pokemon.image,
                ),
              ),
            ),
            Text(
              pokemon.name.capitalize(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
