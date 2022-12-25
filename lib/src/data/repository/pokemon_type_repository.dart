import 'package:domain/data_repository/pokemon_type_data_repository.dart';
import 'package:domain/model/pokemon_type.dart';
import 'package:pokemon_weakness/src/data/local/pokemon_type_lds.dart';
import 'package:pokemon_weakness/src/data/mapper/local_to_domain.dart';

class PokemonTypeRepository implements PokemonTypeDataRepository {
  PokemonTypeRepository({
    required this.localDataSource,
  });

  final PokemonTypeLDSProtocol localDataSource;

  @override
  Future<List<PokemonType>> getPokemonTypeList() => localDataSource
      .getPokemonTypeList()
      .then((response) => response.toDomain());
}
