import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_stateless_widget.dart';

class AdaptiveAppBarAction extends AdaptiveStatelessWidget {
  const AdaptiveAppBarAction({
    required this.child,
    this.onPressed,
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget buildCupertinoWidget(
    BuildContext context,
  ) =>
      CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: child,
      );

  @override
  Widget buildMaterialWidget(
    BuildContext context,
  ) =>
      IconButton(
        onPressed: onPressed,
        icon: child,
      );
}
