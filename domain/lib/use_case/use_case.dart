import 'package:domain/logger.dart';
import 'package:meta/meta.dart';

abstract class UseCase<P, R> {
  const UseCase({
    required this.errorLogger,
  });

  final ErrorLogger errorLogger;

  @required
  Future<R> getRawFuture({P? params});

  Future<R> getFuture({
    P? params,
  }) =>
      getRawFuture(
        params: params,
      ).catchError(
        (error) {
          errorLogger.logError(error);
          throw error;
        },
      );
}
