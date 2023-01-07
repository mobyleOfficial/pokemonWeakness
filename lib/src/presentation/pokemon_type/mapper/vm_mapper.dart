import 'package:flutter/widgets.dart';
import 'package:pokemon_weakness/src/presentation/common/pokemon_colors.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/pokemon_vm_properties_factory.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_vm.dart';

extension PokemonVMMapper on PokemonTypeVM {
  static const _emptyString = "";

  Color get color =>
      PokemonVMPropertiesFactory.getColor(id) ?? PokemonColors.white;

  String get iconPath =>
      PokemonVMPropertiesFactory.getIconPath(id) ?? _emptyString;

  String name(BuildContext context) =>
      PokemonVMPropertiesFactory.getName(context, id) ?? _emptyString;

  Color borderColor(PokemonTypeVM? selected) {
    if (selected == null) {
      return PokemonColors.transparent;
    }
    if (selected.weaknessList.contains(id)) {
      return PokemonColors.mayGreen;
    } else if (selected.resistanceList.contains(id)) {
      return PokemonColors.persianRed;
    } else if (selected.ineffectivenessList.contains(id)) {
      return PokemonColors.arsenic;
    }
    return PokemonColors.transparent;
  }

  PokemonOpacity opacity(PokemonTypeId? selectedId) =>
      id == selectedId ? PokemonOpacity.opaque : PokemonOpacity.translucent;
}
