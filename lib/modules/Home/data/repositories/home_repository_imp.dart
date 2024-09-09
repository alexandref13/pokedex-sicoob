import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_sicoob/core/domain/exceptions/server_exception.dart';
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/modules/Home/data/repositories/endpoints/pokemons_endpoint.dart';
import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository.dart';
import 'package:pokedex_sicoob/modules/Home/domain/models/pokemon_model.dart';

class HomeRepositoryImp implements HomeRepository {
  final http.Client client;

  HomeRepositoryImp({required this.client});

  @override
  Future<List<PokemonModel>> getPokemons({int? page}) async {
    final response = await client.get(PokemonsEndpoint.getPokemon(page));

    List<PokemonModel> pokemons = [];
    final data = json.decode(response.body)["results"] as List;

    if (response.statusCode == 200) {
      pokemons = data.map((element) => PokemonModel.fromJson(element)).toList();

      return pokemons;
    } else {
      throw ServerException("Algo deu errado, tente novamente mais tarde");
    }
  }

  @override
  Future<PokemonDetailsModel> getPokemonByName({required String name}) async {
    final response = await client.get(
      PokemonsEndpoint.getPokemonByName(name),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return PokemonDetailsModel.fromJson(data);
    } else {
      throw ServerException("Algo deu errado, tente novamente mais tarde");
    }
  }
}
