import 'package:domain/use_case/get_pokemon_type_list_uc.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_app_bar_action.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_scaffold.dart';
import 'package:pokemon_weakness/src/presentation/common/async_snapshot_response_view.dart';
import 'package:pokemon_weakness/src/presentation/common/route_name_builder.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/pokemon_type_bloc.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/pokemon_type_state.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/views/pokemon_grid_tile.dart';
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
      AdaptiveScaffold(
        title: "Pokemon weakness",
        action: AdaptiveAppBarAction(
          child: const Icon(Icons.settings),
          onPressed: () {
            Navigator.restorablePushNamed(
              context,
              RouteNameBuilder.settingsScreen,
            );
          },
        ),
        body: StreamBuilder<PokemonTypeState>(
          stream: bloc.onNewState,
          builder: (_, snapshot) =>
              AsyncSnapshotResponseView<Success, Loading, Error>(
            snapshot: snapshot,
            successWidgetBuilder: (_, data) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: data.viewModelList.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => PokemonGridTile(
                model: data.viewModelList[index],
              ),
            ),
          ),
        ),
      );
}
