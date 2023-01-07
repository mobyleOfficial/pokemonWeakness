import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon_weakness/src/presentation/common/pokemon_colors.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/pokemon_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';

class SteelVMProperties extends PokemonVMProperties {
  @override
  Color get color => PokemonColors.cadetBlue;

  @override
  String get iconPath => "assets/images/steel.png";

  @override
  PokemonTypeId get id => PokemonTypeId.steel;

  @override
  String name(BuildContext context) =>
      AppLocalizations.of(context)?.steelName ?? emptyString;
}
