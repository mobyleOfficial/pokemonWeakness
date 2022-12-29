import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_vm.dart';

extension PokemonNameMapper on PokemonTypeVM {
  String toPokemonName(BuildContext context) {
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
}
