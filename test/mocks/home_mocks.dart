import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:pokedex_sicoob/modules/Home/data/repositories/home_repository.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemon_by_name.dart';
import 'package:pokedex_sicoob/modules/Home/data/usecases/get_pokemons_usecase.dart';

@GenerateMocks([http.Client])
@GenerateMocks([HomeRepository])
@GenerateMocks([GetPokemonsUsecase])
@GenerateMocks([GetPokemonByNameUsecase])
void main() {}
