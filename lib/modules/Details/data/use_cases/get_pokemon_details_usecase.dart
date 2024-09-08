import 'package:pokedex_sicoob/core/domain/models/pokemon_details_model.dart';
import 'package:pokedex_sicoob/modules/Details/data/repositories/details_repository.dart';

abstract class GetPokemonDetailsUsecase {
  Future<PokemonDetailsModel> getPokemonDetails({required String id});
}

class GetPokemonDetailsUsecaseImp implements GetPokemonDetailsUsecase {
  final DetailsRepository detailsRepository;

  GetPokemonDetailsUsecaseImp({required this.detailsRepository});

  @override
  Future<PokemonDetailsModel> getPokemonDetails({required String id}) async {
    try {
      return await detailsRepository.getPokemonsDetails(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
