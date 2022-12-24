import 'package:domain/data_repository/pokemon_type_data_repository.dart';
import 'package:domain/model/pokemon_type.dart';
import 'package:domain/use_case/use_case.dart';

class GetPokemonTypeListUC extends UseCase<void, List<PokemonType>> {
  GetPokemonTypeListUC({
    required this.repository,
    required super.errorLogger,
  });

  final PokemonTypeDataRepository repository;

  @override
  Future<List<PokemonType>> getRawFuture({
    void params,
  }) =>
      repository.getPokemonTypeList();
}
