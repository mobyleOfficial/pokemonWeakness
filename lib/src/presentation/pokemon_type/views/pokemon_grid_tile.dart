import 'package:flutter/material.dart';
import 'package:pokemon_weakness/src/presentation/common/pokemon_colors.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/model/pokemon_type_vm.dart';

class PokemonGridTile extends StatelessWidget {
  const PokemonGridTile({
    required this.model,
    Key? key,
  }) : super(key: key);

  final PokemonTypeVM model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.center,
              child: Image.asset(
                model.iconPath,
                errorBuilder: (_, __, ___) => Container(),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.brightness == Brightness.light
                ? PokemonColors.white.withAlpha(127)
                : PokemonColors.black.withAlpha(127),
            child: Text(model.id.name),
          ),
        ],
      ),
    );
  }
}
