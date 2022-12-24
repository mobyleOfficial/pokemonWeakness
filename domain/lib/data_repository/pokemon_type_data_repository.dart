import 'package:domain/model/pokemon_type.dart';

abstract class PokemonTypeDataRepository {
  Future<List<PokemonType>> getPokemonTypeList();
}
