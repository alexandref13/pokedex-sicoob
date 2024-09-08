import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_sicoob/core/service/pokemon_platform_channel.dart';
import 'package:pokedex_sicoob/core/service/pokemon_platform_channel_imp.dart';
import 'package:pokedex_sicoob/modules/Details/details_service_locator.dart';
import 'package:pokedex_sicoob/modules/Home/home_service_locator.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<PokemonPlatformChannel>(
    () => PokemonPlatformChannelImp(),
  );

  homeServiceLocator();
  detailsServiceLocator();
}
