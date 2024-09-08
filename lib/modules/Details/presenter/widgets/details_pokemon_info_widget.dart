import 'package:flutter/material.dart';
import 'package:pokedex_sicoob/core/extensions/string_extensions.dart';
import 'package:pokedex_sicoob/modules/Details/domain/models/pokemon_details_model.dart';

class DetailsPokemonInfoWidget extends StatelessWidget {
  final PokemonDetailsModel pokemon;
  const DetailsPokemonInfoWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final infoList = [
      {
        "title": "Nome: ",
        "value": pokemon.name.capitalize(),
      },
      {
        "title": "Altura: ",
        "value": pokemon.height,
      },
      {
        "title": "Experiência: ",
        "value": pokemon.baseExperience,
      },
    ];

    return ListView.builder(
      itemCount: infoList.length,
      itemBuilder: (context, index) {
        var info = infoList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                info["title"].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(info["value"].toString()),
            ],
          ),
        );
      },
    );
  }
}
