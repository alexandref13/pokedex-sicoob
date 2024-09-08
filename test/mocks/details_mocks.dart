import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:pokedex_sicoob/modules/Details/data/repositories/details_repository.dart';
import 'package:pokedex_sicoob/modules/Details/data/use_cases/get_pokemon_details_usecase.dart';

@GenerateMocks([http.Client])
@GenerateMocks([DetailsRepository])
@GenerateMocks([GetPokemonDetailsUsecase])
void main() {}
