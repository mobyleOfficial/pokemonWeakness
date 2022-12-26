import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_stateless_widget.dart';

class AdaptiveProgressIndicator extends AdaptiveStatelessWidget {
  const AdaptiveProgressIndicator({
    super.key,
  });

  @override
  Widget buildCupertinoWidget(
    BuildContext context,
  ) =>
      const CupertinoActivityIndicator(
        radius: 15,
      );

  @override
  Widget buildMaterialWidget(
    BuildContext context,
  ) =>
      const CircularProgressIndicator();
}
