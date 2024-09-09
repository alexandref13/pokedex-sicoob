import 'package:flutter/services.dart';
import 'package:pokedex_sicoob/core/service/pokemon_platform_channel.dart';

class PokemonPlatformChannelImp implements PokemonPlatformChannel {
  var platform = MethodChannel('samples.flutter.dev/battery');

  @override
  Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');

      print({result});
      if (result != null && result >= 50) {
        batteryLevel = 'UAU, voce com certeza vai capturar este pokemon.';
      }

      batteryLevel =
          "As chances não as melhores, mas os melhores estão preparados pra isso!";
    } on PlatformException catch (_) {
      batteryLevel = "Acho que ele já fugiu, sinto muito";
    }

    return batteryLevel;
  }
}
