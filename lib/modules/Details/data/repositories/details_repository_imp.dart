import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_sicoob/core/domain/exceptions/server_exception.dart';
import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/modules/Details/data/repositories/details_repository.dart';
import 'package:pokedex_sicoob/modules/Details/data/repositories/endpoints/pokemon_details_endpoint.dart';

class DetailsRepositoryImp implements DetailsRepository {
  final http.Client client;

  DetailsRepositoryImp({required this.client});

  @override
  Future<PokemonDetailsModel> getPokemonsDetails({required String id}) async {
    final response = await client.get(
      PokemonsDetailsEndpoint.getPokemonDetails(id),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return PokemonDetailsModel.fromJson(data);
    } else {
      throw ServerException(
        "Algo deu errado, tente novamente mais tarde",
      );
    }
  }
}
