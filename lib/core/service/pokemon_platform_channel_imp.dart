import 'package:flutter/services.dart';
import 'package:pokedex_sicoob/core/service/pokemon_platform_channel.dart';

class PokemonPlatformChannelImp implements PokemonPlatformChannel {
  var platform = MethodChannel('samples.flutter.dev/battery');

  @override
  Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    return batteryLevel;
  }
}
