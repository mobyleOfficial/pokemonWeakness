import 'package:domain/use_case/get_pokemon_type_list_uc.dart';
import 'package:pokemon_weakness/src/common/subscription_holder.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/mapper/domain_to_view_model.dart';
import 'package:pokemon_weakness/src/presentation/pokemon_type/pokemon_type_state.dart';
import 'package:rxdart/rxdart.dart';

class PokemonTypeBloc with SubscriptionHolder {
  PokemonTypeBloc({
    required this.getPokemonTypeListUC,
  }) {
    subscription
      ..add(
        _fetchPokemonTypeList(_onErrorSubject).listen(
          _onNewStateSubject.add,
        ),
      )
      ..add(
        _onTryAgainSubject.stream
            .flatMap((_) => _fetchPokemonTypeList(_onErrorSubject))
            .listen(_onNewStateSubject.add),
      );
  }

  final GetPokemonTypeListUC getPokemonTypeListUC;

  final _onTryAgainSubject = PublishSubject<void>();
  Sink<void> get onTryAgain => _onTryAgainSubject.sink;

  final _onNewStateSubject = BehaviorSubject<PokemonTypeState>();
  Stream<PokemonTypeState> get onNewState => _onNewStateSubject.stream;

  final _onErrorSubject = PublishSubject<void>();
  Stream<void> get onError => _onNewStateSubject.stream;

  Stream<PokemonTypeState> _fetchPokemonTypeList(
    Sink errorSink,
  ) async* {
    yield Loading();
    try {
      final result = await getPokemonTypeListUC.getFuture();
      yield Success(viewModelList: result.toVM(result.first));
    } catch (error) {
      yield Error();
      errorSink.add(null);
    }
  }

  @override
  void dispose() {
    _onTryAgainSubject.close();
    _onNewStateSubject.close();
    _onErrorSubject.close();
    disposeAll();
  }
}
