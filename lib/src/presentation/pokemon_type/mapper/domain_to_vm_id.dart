import 'package:domain/model/pokemon_type.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_id.dart';

extension PokemonTypeVMIdMapper on PokemonType {
  PokemonTypeId get vmId => name.vmId;
}

extension PokemonTypeStringMapper on String {
  PokemonTypeId get vmId {
    switch (this) {
      case "bug":
        return PokemonTypeId.bug;
      case "dark":
        return PokemonTypeId.dark;
      case "dragon":
        return PokemonTypeId.dragon;
      case "electric":
        return PokemonTypeId.electric;
      case "fire":
        return PokemonTypeId.fire;
      case "fairy":
        return PokemonTypeId.fairy;
      case "fighting":
        return PokemonTypeId.fighting;
      case "flying":
        return PokemonTypeId.flying;
      case "ghost":
        return PokemonTypeId.ghost;
      case "grass":
        return PokemonTypeId.grass;
      case "ground":
        return PokemonTypeId.ground;
      case "ice":
        return PokemonTypeId.ice;
      case "normal":
        return PokemonTypeId.normal;
      case "poison":
        return PokemonTypeId.poison;
      case "psychic":
        return PokemonTypeId.psychic;
      case "rock":
        return PokemonTypeId.rock;
      case "steel":
        return PokemonTypeId.steel;
      case "water":
        return PokemonTypeId.water;
      default:
        return PokemonTypeId.unknown;
    }
  }
}
