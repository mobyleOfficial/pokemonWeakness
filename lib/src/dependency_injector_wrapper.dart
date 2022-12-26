import 'package:domain/data_repository/pokemon_type_data_repository.dart';
import 'package:domain/logger.dart';
import 'package:domain/use_case/get_pokemon_type_list_uc.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:pokemon_weakness/src/data/local/pokemon_type_lds.dart';
import 'package:pokemon_weakness/src/data/repository/pokemon_type_repository.dart';
import 'package:provider/provider.dart';

class DependencyInjectorWrapper extends StatelessWidget {
  const DependencyInjectorWrapper(
    this.child, {
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<ErrorLogger>(
            create: (_) => Log(),
          ),
          Provider<PokemonTypeLDS>(
            create: (_) => PokemonTypeLDS(),
          ),
          ProxyProvider<PokemonTypeLDS, PokemonTypeDataRepository>(
            update: (_, dataSource, __) => PokemonTypeRepository(
              localDataSource: dataSource,
            ),
          ),
          ProxyProvider2<PokemonTypeDataRepository, ErrorLogger,
              GetPokemonTypeListUC>(
            update: (_, repository, errorLogger, __) => GetPokemonTypeListUC(
              repository: repository,
              errorLogger: errorLogger,
            ),
          ),
        ],
        child: child,
      );
}

class Log extends ErrorLogger {
  final _logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  void logError(error) {
    final stackTrace = error is Error ? error.stackTrace : null;
    _logger.e('UseCase Error', [error, stackTrace]);
  }
}
