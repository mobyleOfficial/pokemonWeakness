import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/bug_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/dark_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/dragon_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/electric_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/fairy_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/fighting_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/fire_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/flying_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/ghost_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/grass_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/ground_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/ice_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/normal_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/poison_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/psychic_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/rock_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/steel_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/properties/water_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';

class PokemonVMPropertiesFactory {
  static final _propertiesList = [
    BugVMProperties(),
    DarkVMProperties(),
    DragonVMProperties(),
    ElectricVMProperties(),
    FireVMProperties(),
    FairyVMProperties(),
    FightingVMProperties(),
    FlyingVMProperties(),
    GhostVMProperties(),
    GrassVMProperties(),
    GroundVMProperties(),
    IceVMProperties(),
    NormalVMProperties(),
    PoisonVMProperties(),
    PsychicVMProperties(),
    RockVMProperties(),
    SteelVMProperties(),
    WaterVMProperties(),
  ];

  static Color? getColor(
    PokemonTypeId id,
  ) =>
      _propertiesList
          .firstWhereOrNull((properties) => properties.id == id)
          ?.color;

  static String? getIconPath(
    PokemonTypeId id,
  ) =>
      _propertiesList
          .firstWhereOrNull((properties) => properties.id == id)
          ?.iconPath;

  static String? getName(
    BuildContext context,
    PokemonTypeId id,
  ) =>
      _propertiesList
          .firstWhereOrNull((properties) => properties.id == id)
          ?.name(context);
}
