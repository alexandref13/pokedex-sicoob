import 'package:flutter/material.dart';
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/core/widgets/custom_cached_image_widget.dart';

class DetailsPokemonImageWidget extends StatelessWidget {
  final PokemonDetailsModel pokemon;
  const DetailsPokemonImageWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      child: Hero(
        tag: "pokemon-${pokemon.id}",
        child: CustomCachedImageWidget(
          url: pokemon.image,
        ),
      ),
    );
  }
}
