import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon_weakness/src/presentation/common/pokemon_colors.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_vm.dart';

extension PokemonVMMapper on PokemonTypeVM {
  Color get color {
    switch (id) {
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

  String get iconPath {
    switch (id) {
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

  String name(BuildContext context) {
    const String emptyString = "";
    switch (id) {
      case PokemonTypeId.bug:
        return AppLocalizations.of(context)?.bugName ?? emptyString;
      case PokemonTypeId.dark:
        return AppLocalizations.of(context)?.darkName ?? emptyString;
      case PokemonTypeId.dragon:
        return AppLocalizations.of(context)?.dragonName ?? emptyString;
      case PokemonTypeId.electric:
        return AppLocalizations.of(context)?.electricName ?? emptyString;
      case PokemonTypeId.fire:
        return AppLocalizations.of(context)?.fireName ?? emptyString;
      case PokemonTypeId.fairy:
        return AppLocalizations.of(context)?.fairyName ?? emptyString;
      case PokemonTypeId.fighting:
        return AppLocalizations.of(context)?.fightingName ?? emptyString;
      case PokemonTypeId.flying:
        return AppLocalizations.of(context)?.flyingName ?? emptyString;
      case PokemonTypeId.ghost:
        return AppLocalizations.of(context)?.ghostName ?? emptyString;
      case PokemonTypeId.grass:
        return AppLocalizations.of(context)?.grassName ?? emptyString;
      case PokemonTypeId.ground:
        return AppLocalizations.of(context)?.groundName ?? emptyString;
      case PokemonTypeId.ice:
        return AppLocalizations.of(context)?.iceName ?? emptyString;
      case PokemonTypeId.normal:
        return AppLocalizations.of(context)?.normalName ?? emptyString;
      case PokemonTypeId.poison:
        return AppLocalizations.of(context)?.poisonName ?? emptyString;
      case PokemonTypeId.psychic:
        return AppLocalizations.of(context)?.psychicName ?? emptyString;
      case PokemonTypeId.rock:
        return AppLocalizations.of(context)?.rockName ?? emptyString;
      case PokemonTypeId.steel:
        return AppLocalizations.of(context)?.steelName ?? emptyString;
      case PokemonTypeId.water:
        return AppLocalizations.of(context)?.waterName ?? emptyString;
      default:
        return emptyString;
    }
  }

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
