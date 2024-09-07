import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_sicoob/modules/Home/data/repositories/endpoints/pokemons_endpoint.dart';
import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

class HomeRepositoryImp implements HomeRepository {
  final http.Client client;

  HomeRepositoryImp({required this.client});

  @override
  Future<List<PokemonModel>> getPokemons() async {
    final response = await client.get(PokemonsEndpoint.getPokemon());

    List<PokemonModel> pokemons = [];
    final data = json.decode(response.body)["results"] as List;

    if (response.statusCode == 200) {
      pokemons = data.map((element) => PokemonModel.fromJson(element)).toList();

      return pokemons;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List> getPokemonsDetails() {
    // TODO: implement getPokemonsDetails
    throw UnimplementedError();
  }
}
