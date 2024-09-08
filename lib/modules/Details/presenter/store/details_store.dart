import 'package:mobx/mobx.dart';
import 'package:pokedex_sicoob/core/service/pokemon_platform_channel.dart';
import 'package:pokedex_sicoob/modules/Details/data/use_cases/get_pokemon_details_usecase.dart';
import 'package:pokedex_sicoob/modules/Details/presenter/states/pokemon_details_state.dart';

part 'details_store.g.dart';

// NOTE -> Aqui eu fiquei na duvida entre usar ou nao usar os packages: mobx_codegen, build_runner e flutter_mobx
// NOTE -> Mas aqui usei pelo fato de estar na documentaçao oficial do Mobx para fazer uso do mobx_codegen

class DetailsStoreImp = DetailsStore with _$DetailsStoreImp;

abstract class DetailsStore with Store {
  GetPokemonDetailsUsecase getPokemonDetailsUsecase;
  PokemonPlatformChannel pokemonPlatformChannel;

  DetailsStore({
    required this.getPokemonDetailsUsecase,
    required this.pokemonPlatformChannel,
  });

  @observable
  String batteryLevel = "";

  @observable
  PokemonDetailsState pokemonState = PokemonDetailsLoadingState();

  @action
  Future<void> fetchPokemonById({required String id}) async {
    try {
      pokemonState = PokemonDetailsLoadingState();

      final response = await getPokemonDetailsUsecase.getPokemonDetails(
        id: id,
      );

      pokemonState = PokemonDetailsSuccessState(response);
    } catch (e) {
      print(e);
      pokemonState = PokemonDetailsErrorState(
        "Algo deu errado na solicitação, tente novamente mais tarde! $e",
      );
    }
  }

  @action
  handleGetBatteryLevel() async {
    final response = await pokemonPlatformChannel.getBatteryLevel();

    batteryLevel = response;
  }
}
