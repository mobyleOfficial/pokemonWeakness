import 'package:flutter/widgets.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_progress_indicator.dart';

typedef ResponseViewBuilder<T> = Widget Function(BuildContext, T);

class AsyncSnapshotResponseView<Success, Loading, Error>
    extends StatelessWidget {
  const AsyncSnapshotResponseView({
    required this.snapshot,
    required this.successWidgetBuilder,
    this.onTryAgainTap,
    this.errorWidgetBuilder,
    this.loadingWidgetBuilder,
    super.key,
  });

  final AsyncSnapshot snapshot;
  final ResponseViewBuilder<Success> successWidgetBuilder;
  final ResponseViewBuilder<Loading>? loadingWidgetBuilder;
  final ResponseViewBuilder<Error>? errorWidgetBuilder;
  final GestureTapCallback? onTryAgainTap;

  @override
  Widget build(BuildContext context) {
    final snapshotData = snapshot.data;
    if (snapshotData == null || snapshotData is Loading) {
      if (loadingWidgetBuilder != null) {
        return loadingWidgetBuilder!(context, snapshotData);
      }
      return const AdaptiveProgressIndicator();
    }
    if (snapshotData is Error) {
      if (errorWidgetBuilder != null) {
        return errorWidgetBuilder!(context, snapshotData);
      }
    }
    if (snapshotData is Success) {
      return successWidgetBuilder(context, snapshotData);
    }
    throw UnknownStateTypeException();
  }
}

class UnknownStateTypeException implements Exception {}
