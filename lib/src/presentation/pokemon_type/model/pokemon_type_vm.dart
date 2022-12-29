import 'dart:ui';

import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';

class PokemonTypeVM {
  const PokemonTypeVM({
    required this.id,
    required this.color,
    required this.iconPath,
    this.weaknessList = const [],
    this.resistanceList = const [],
    this.ineffectivenessList = const [],
  });

  final PokemonTypeId id;
  final Color color;
  final String iconPath;
  final List<PokemonTypeId> weaknessList;
  final List<PokemonTypeId> resistanceList;
  final List<PokemonTypeId> ineffectivenessList;
}
