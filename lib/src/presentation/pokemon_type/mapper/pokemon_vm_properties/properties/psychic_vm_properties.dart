import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon_weakness/src/presentation/common/pokemon_colors.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/pokemon_vm_properties/pokemon_vm_properties.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';

class PsychicVMProperties extends PokemonVMProperties {
  @override
  Color get color => PokemonColors.congoPink;

  @override
  String get iconPath => "assets/images/psychic.png";

  @override
  PokemonTypeId get id => PokemonTypeId.psychic;

  @override
  String name(BuildContext context) =>
      AppLocalizations.of(context)?.psychicName ?? emptyString;
}
