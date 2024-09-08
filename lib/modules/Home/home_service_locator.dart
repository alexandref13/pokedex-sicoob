import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository.dart';
import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository_imp.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemon_by_name.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemons_usecase.dart';
import 'package:pokedex_sicoob/modules/Home/presenter/store/home_store.dart';

final GetIt getIt = GetIt.instance;

void homeServiceLocator() {
  getIt.registerSingleton<HomeRepository>(
      HomeRepositoryImp(client: getIt<Client>()));

  getIt.registerSingleton<GetPokemonsUsecase>(
    GetPokemonsUsecaseImp(homeRepository: getIt<HomeRepository>()),
  );

  getIt.registerSingleton<GetPokemonByNameUsecase>(
    GetPokemonByNameUsecaseImp(homeRepository: getIt<HomeRepository>()),
  );

  getIt.registerSingleton<HomeStore>(
    HomeStoreImp(
      getPokemonsUseCase: getIt<GetPokemonsUsecase>(),
      getPokemonByNameUsecase: getIt<GetPokemonByNameUsecase>(),
    ),
  );
}
