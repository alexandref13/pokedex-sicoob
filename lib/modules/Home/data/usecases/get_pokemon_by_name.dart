import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository.dart';

abstract class GetPokemonByNameUsecase {
  Future<PokemonDetailsModel> getPokemonByName({required String name});
}

class GetPokemonByNameUsecaseImp implements GetPokemonByNameUsecase {
  final HomeRepository homeRepository;

  GetPokemonByNameUsecaseImp({required this.homeRepository});

  @override
  Future<PokemonDetailsModel> getPokemonByName({required String name}) async {
    try {
      return await homeRepository.getPokemonByName(name: name);
    } catch (e) {
      rethrow;
    }
  }
}
