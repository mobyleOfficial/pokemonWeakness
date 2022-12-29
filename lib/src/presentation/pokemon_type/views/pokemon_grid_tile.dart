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
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: model.color.withAlpha(model.opacity.value),
          border: Border.all(
            color: model.borderColor,
            width: 4,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
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
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color:
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? PokemonColors.white.withAlpha(127)
                        : PokemonColors.black.withAlpha(127),
              ),
              child: Text(model.id.name),
            ),
          ],
        ),
      );
}
