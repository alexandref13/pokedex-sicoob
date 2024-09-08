import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pokedex_sicoob/modules/Details/data/repositories/details_repository.dart';
import 'package:pokedex_sicoob/modules/Details/data/repositories/details_repository_imp.dart';
import 'package:pokedex_sicoob/modules/Details/data/use_cases/get_pokemon_details_usecase.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/store/details_store.dart';

final GetIt getIt = GetIt.instance;

void detailsServiceLocator() {
  getIt.registerSingleton<DetailsRepository>(
      DetailsRepositoryImp(client: getIt<Client>()));

  getIt.registerSingleton<GetPokemonDetailsUsecase>(
    GetPokemonDetailsUsecaseImp(detailsRepository: getIt<DetailsRepository>()),
  );

  getIt.registerSingleton<DetailsStore>(
    DetailsStoreImp(
        getPokemonDetailsUsecase: getIt<GetPokemonDetailsUsecase>()),
  );
}
