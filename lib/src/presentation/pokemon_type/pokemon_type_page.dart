import 'package:domain/use_case/get_pokemon_type_list_uc.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_scaffold.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/pokemon_type_bloc.dart';
import 'package:provider/provider.dart';

class PokemonTypePage extends StatelessWidget {
  const PokemonTypePage({
    required this.bloc,
    super.key,
  });

  final PokemonTypeBloc bloc;

  static Widget create(
    BuildContext context,
  ) =>
      ProxyProvider<GetPokemonTypeListUC, PokemonTypeBloc>(
        update: (context, useCase, previous) =>
            previous ??
            PokemonTypeBloc(
              getPokemonTypeListUC: useCase,
            ),
        dispose: (context, bloc) => bloc.dispose(),
        child: Consumer<PokemonTypeBloc>(
          builder: (context, bloc, _) => PokemonTypePage(bloc: bloc),
        ),
      );

  @override
  Widget build(
    BuildContext context,
  ) =>
      const AdaptiveScaffold(
        title: "test",
        body: Center(
          child: Text("hi"),
        ),
      );
}
