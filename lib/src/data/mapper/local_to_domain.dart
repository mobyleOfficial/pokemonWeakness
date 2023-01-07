import 'package:domain/model/pokemon_type.dart';
import 'package:pokemon_weakness/src/data/local/model/pokemon_type_lm.dart';

extension on PokemonTypeLM {
  PokemonType toDomain() => PokemonType(
        id: id,
        weaknessList: weaknessList?.nameList ?? [],
        resistanceList: resistanceList?.nameList ?? [],
        ineffectivenessList: ineffectivenessList?.nameList ?? [],
      );
}

extension on List<PokemonTypeLM> {
  List<String> get nameList => map((type) => type.id).toList();
}

extension PokemonTypeLMMapper on List<PokemonTypeLM> {
  List<PokemonType> toDomain() => map((type) => type.toDomain()).toList();
}
