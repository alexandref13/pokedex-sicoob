import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_sicoob/modules/Home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

void main() {
  group("Pokemon Model", () {
    final pokemonModel = PokemonModel(
        name: "pikachu", url: 'https://pokeapi.co/api/v2/pokemon/1/');
    test('should be a subclass of PokemonEntity', () {
      expect(pokemonModel, isA<PokemonEntity>());
    });

    test('should return a valid model', () {
      final Map<String, dynamic> jsonMap = {
        "name": "pikachu",
        "url": "https://pokeapi.co/api/v2/pokemon/1/"
      };

      final result = PokemonModel.fromJson(jsonMap);

      expect(result.name, "pikachu");
      expect(result.url, "https://pokeapi.co/api/v2/pokemon/1/");
      expect(result.id, "1");
      expect(result.image,
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png");
    });

    test('should return a json map containing the proper data', () {
      final expectedMap = {
        "name": "pikachu",
        "url": "https://pokeapi.co/api/v2/pokemon/1/"
      };
      final result = pokemonModel.toJson();
      expect(result, expectedMap);
    });

    test('should return a proper image url', () {
      final jsonMap = {
        "name": "pikachu",
        "url": "https://pokeapi.co/api/v2/pokemon/1/"
      };

      final result = PokemonModel.fromJson(jsonMap);

      expect(result, isA<PokemonModel>());

      expect(
        result.image,
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      );
    });
  });
}
