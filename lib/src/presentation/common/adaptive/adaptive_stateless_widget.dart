import 'package:flutter/widgets.dart';
import 'package:pokemon_weakness/src/presentation/common/platform_utils.dart';

abstract class AdaptiveStatelessWidget extends StatelessWidget {
  const AdaptiveStatelessWidget({
    super.key,
  });

  Widget buildCupertinoWidget(BuildContext context);

  Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(
    BuildContext context,
  ) =>
      PlatformUtils.isIOS
          ? buildCupertinoWidget(context)
          : buildMaterialWidget(context);
}
