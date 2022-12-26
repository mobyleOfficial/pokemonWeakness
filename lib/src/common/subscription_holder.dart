import 'package:rxdart/rxdart.dart';

mixin SubscriptionHolder {
  final CompositeSubscription subscription = CompositeSubscription();

  void disposeAll() {
    subscription.dispose();
  }

  void dispose();
}
