import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_app_bar_action.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_stateless_widget.dart';

class AdaptiveScaffold extends AdaptiveStatelessWidget {
  const AdaptiveScaffold({
    required this.body,
    this.title,
    this.action,
    this.backgroundColor,
    super.key,
  });

  final Widget body;
  final String? title;
  final AdaptiveAppBarAction? action;
  final Color? backgroundColor;

  @override
  Widget buildCupertinoWidget(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: title != null
            ? CupertinoNavigationBar(
                middle: Text(
                  title!,
                  maxLines: 1,
                ),
                trailing: action,
              )
            : null,
        child: SafeArea(child: body),
      );

  @override
  Widget buildMaterialWidget(BuildContext context) => Scaffold(
        appBar: title != null
            ? AppBar(
                title: Text(
                  title!,
                  maxLines: 1,
                ),
                actions: action != null ? [action!] : null,
              )
            : null,
        body: body,
        backgroundColor: backgroundColor,
      );
}
