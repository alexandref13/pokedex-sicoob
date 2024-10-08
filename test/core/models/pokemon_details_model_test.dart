import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_sicoob/core/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';

void main() {
  group("Pokemon Details Model", () {
    final pokemonDetailsModel = PokemonDetailsModel(
      id: 1,
      name: "pikachu",
      baseExperience: 10,
      height: 10,
      weight: 10,
    );
    test('should be a subclass of PokemonDetailsEntity', () {
      expect(pokemonDetailsModel, isA<PokemonDetailsEntity>());
    });

    test('should return a valid model', () {
      final Map<String, dynamic> jsonMap = {
        "id": 1,
        "name": "pikachu",
        "base_experience": 10,
        "height": 10,
        "weight": 10,
      };

      final result = PokemonDetailsModel.fromJson(jsonMap);

      expect(result.name, "pikachu");
      expect(result.image,
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png");
    });

    test('should return a json map containing the proper data', () {
      final expectedMap = {
        "id": 1,
        "name": "pikachu",
        "base_experience": 10,
        "height": 10,
        "weight": 10,
      };
      final result = pokemonDetailsModel.toJson();
      expect(result, expectedMap);
    });

    test('should return a proper image url', () {
      final jsonMap = {
        "id": 1,
        "name": "pikachu",
        "base_experience": 10,
        "height": 10,
        "weight": 10,
      };

      final result = PokemonDetailsModel.fromJson(jsonMap);

      expect(result, isA<PokemonDetailsModel>());

      expect(
        result.image,
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      );
    });
  });
}
