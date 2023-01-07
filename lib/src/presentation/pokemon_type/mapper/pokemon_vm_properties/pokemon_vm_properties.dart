import 'package:flutter/widgets.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';

abstract class PokemonVMProperties {
  final emptyString = "";
  PokemonTypeId get id;
  Color get color;
  String get iconPath;
  String name(BuildContext context);
}
