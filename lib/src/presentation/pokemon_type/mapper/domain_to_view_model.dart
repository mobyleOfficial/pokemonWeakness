import 'package:domain/model/pokemon_type.dart';
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
        ineffectivenessList: ineffectivenessList.idList,
        weaknessList: weaknessList.idList,
        resistanceList: resistanceList.idList,
      );
}

extension on List<String> {
  List<PokemonTypeId> get idList => map((type) => type.vmId).toList();
}
