import 'package:domain/model/pokemon_type.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';

extension PokemonTypeVMIdMapper on PokemonType {
  PokemonTypeId get vmId => id.vmId;
}

extension PokemonTypeStringMapper on String {
  PokemonTypeId get vmId => PokemonTypeId.values.firstWhere(
        (id) => describeEnum(id) == this,
        orElse: () => PokemonTypeId.unknown,
      );
}
