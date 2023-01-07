import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon_weakness/src/presentation/common/pokemon_colors.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/pokemon_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';

class DragonVMProperties extends PokemonVMProperties {
  @override
  Color get color => PokemonColors.denimBlue;

  @override
  String get iconPath => "assets/images/dragon.png";

  @override
  PokemonTypeId get id => PokemonTypeId.dragon;

  @override
  String name(BuildContext context) =>
      AppLocalizations.of(context)?.dragonName ?? emptyString;
}
