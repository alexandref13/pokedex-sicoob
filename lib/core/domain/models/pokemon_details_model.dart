import 'package:pokedex_sicoob/core/domain/entities/pokemon_details_entity.dart';

// NOTE -> No momento que meu modulo Home precisa do mesmo model que temos em details, eu decido colocar esta domain em core, pra ser algo usado em toda a aplicaçao

class PokemonDetailsModel extends PokemonDetailsEntity {
  PokemonDetailsModel({
    required super.id,
    required super.name,
    required super.baseExperience,
    required super.height,
    required super.weight,
  });

  String get image =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      id: json['id'],
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'base_experience': baseExperience,
      'height': height,
      'weight': weight,
    };
  }
}
