import 'dart:ui';

import 'package:domain/model/pokemon_type.dart';
import 'package:pokemon_weakness/src/presentation/common/pokemon_colors.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/domain_to_vm_id.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_vm.dart';

extension PokemonTypeVMMapper on List<PokemonType> {
  List<PokemonTypeVM> toVM() => map(
        (type) => type.toVM(),
      ).toList();
}

extension on PokemonType {
  PokemonTypeVM toVM() => PokemonTypeVM(
        id: vmId,
        color: pokemonColor,
        iconPath: pokemonIconPath,
        ineffectivenessList: ineffectivenessList.idList,
        weaknessList: weaknessList.idList,
        resistanceList: resistanceList.idList,
      );

  Color get pokemonColor {
    switch (vmId) {
      case PokemonTypeId.bug:
        return PokemonColors.darkLemonLime;
      case PokemonTypeId.dark:
        return PokemonColors.davyGray;
      case PokemonTypeId.dragon:
        return PokemonColors.denimBlue;
      case PokemonTypeId.electric:
        return PokemonColors.minionYellow;
      case PokemonTypeId.fire:
        return PokemonColors.yellowOrange;
      case PokemonTypeId.fairy:
        return PokemonColors.lavenderMagenta;
      case PokemonTypeId.fighting:
        return PokemonColors.brickRed;
      case PokemonTypeId.flying:
        return PokemonColors.paleCerulean;
      case PokemonTypeId.ghost:
        return PokemonColors.blueViolet;
      case PokemonTypeId.grass:
        return PokemonColors.appleGreen;
      case PokemonTypeId.ground:
        return PokemonColors.burntSienna;
      case PokemonTypeId.ice:
        return PokemonColors.pearlAqua;
      case PokemonTypeId.normal:
        return PokemonColors.quickSilver;
      case PokemonTypeId.poison:
        return PokemonColors.richLilac;
      case PokemonTypeId.psychic:
        return PokemonColors.congoPink;
      case PokemonTypeId.rock:
        return PokemonColors.tan;
      case PokemonTypeId.steel:
        return PokemonColors.cadetBlue;
      case PokemonTypeId.water:
        return PokemonColors.carolinaBlue;
      default:
        return PokemonColors.white;
    }
  }

  String get pokemonIconPath {
    switch (vmId) {
      case PokemonTypeId.bug:
        return "assets/images/bug.png";
      case PokemonTypeId.dark:
        return "assets/images/dark.png";
      case PokemonTypeId.dragon:
        return "assets/images/dragon.png";
      case PokemonTypeId.electric:
        return "assets/images/electric.png";
      case PokemonTypeId.fire:
        return "assets/images/fire.png";
      case PokemonTypeId.fairy:
        return "assets/images/fairy.png";
      case PokemonTypeId.fighting:
        return "assets/images/fighting.png";
      case PokemonTypeId.flying:
        return "assets/images/flying.png";
      case PokemonTypeId.ghost:
        return "assets/images/ghost.png";
      case PokemonTypeId.grass:
        return "assets/images/grass.png";
      case PokemonTypeId.ground:
        return "assets/images/ground.png";
      case PokemonTypeId.ice:
        return "assets/images/ice.png";
      case PokemonTypeId.normal:
        return "assets/images/normal.png";
      case PokemonTypeId.poison:
        return "assets/images/poison.png";
      case PokemonTypeId.psychic:
        return "assets/images/psychic.png";
      case PokemonTypeId.rock:
        return "assets/images/rock.png";
      case PokemonTypeId.steel:
        return "assets/images/steel.png";
      case PokemonTypeId.water:
        return "assets/images/water.png";
      default:
        return "";
    }
  }
}

extension on List<String> {
  List<PokemonTypeId> get idList => map((type) => type.vmId).toList();
}
