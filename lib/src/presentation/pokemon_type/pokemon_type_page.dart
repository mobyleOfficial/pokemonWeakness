import 'package:domain/use_case/get_pokemon_type_list_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        title: AppLocalizations.of(context)?.pokemonWeaknessPageTitle,
        action: AdaptiveAppBarAction(
          child: const Icon(Icons.settings),
          onPressed: () {
            Navigator.restorablePushNamed(
              context,
              RouteNameBuilder.settingsScreen,
            );
          },
        ),
        body: GestureDetector(
          onTap: () => bloc.onSelect.add(null),
          child: StreamBuilder<PokemonTypeState>(
            stream: bloc.onNewState,
            builder: (_, snapshot) =>
                AsyncSnapshotResponseView<Success, Loading, Error>(
              snapshot: snapshot,
              successWidgetBuilder: (_, data) {
                const axisCount = 4;
                final totalItems = data.viewModelList.length;
                final mod = totalItems % axisCount;
                final extraItems = axisCount - (mod > 0 ? mod : axisCount);
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: axisCount,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: extraItems + totalItems,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    if ((totalItems - index - extraItems - axisCount % 2) > 0) {
                      final model = data.viewModelList[index];
                      return GestureDetector(
                        onTap: () => bloc.onSelect.add(model),
                        child: StreamBuilder(
                          stream: bloc.onSelected,
                          builder: (_, snapshot) => PokemonGridTile(
                            model: model,
                            selected: snapshot.data,
                          ),
                        ),
                      );
                    } else if ((totalItems - index) >= 0 &&
                        (totalItems - index) < axisCount / 2) {
                      final model = data.viewModelList[index - 1];
                      return GestureDetector(
                        onTap: () => bloc.onSelect.add(model),
                        child: StreamBuilder(
                          stream: bloc.onSelected,
                          builder: (_, snapshot) => PokemonGridTile(
                            model: model,
                            selected: snapshot.data,
                          ),
                        ),
                      );
                    } else {
                      return Container(color: Colors.transparent);
                    }
                  },
                );
              },
            ),
          ),
        ),
      );
}
