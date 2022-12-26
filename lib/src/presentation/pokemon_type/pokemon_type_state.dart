import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_vm.dart';

abstract class PokemonTypeState {}

class Success implements PokemonTypeState {
  const Success({
    required this.viewModelList,
  });

  final List<PokemonTypeVM> viewModelList;
}

class Loading implements PokemonTypeState {}

class Error implements PokemonTypeState {}
