import 'package:collection/collection.dart';
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
      )
      ..add(
        _onSelectSubject.stream.listen(
          (selectedId) => _updatePokemonSelection(
            _onErrorSubject,
            selectedId,
          ).listen(_onNewStateSubject.add),
        ),
      );
  }

  final GetPokemonTypeListUC getPokemonTypeListUC;

  final _onTryAgainSubject = PublishSubject<void>();
  Sink<void> get onTryAgain => _onTryAgainSubject.sink;

  final _onNewStateSubject = BehaviorSubject<PokemonTypeState>();
  Stream<PokemonTypeState> get onNewState => _onNewStateSubject.stream;

  final _onErrorSubject = PublishSubject<void>();
  Stream<void> get onError => _onNewStateSubject.stream;

  final _onSelectSubject = PublishSubject<String>();
  Sink<String> get onSelect => _onSelectSubject.sink;

  Stream<PokemonTypeState> _fetchPokemonTypeList(
    Sink errorSink,
  ) async* {
    yield Loading();
    try {
      final result = await getPokemonTypeListUC.getFuture();
      yield Success(viewModelList: result.toVM());
    } catch (error) {
      yield Error();
      errorSink.add(null);
    }
  }

  Stream<PokemonTypeState> _updatePokemonSelection(
    Sink errorSink,
    String selectedId,
  ) async* {
    try {
      final result = await getPokemonTypeListUC.getFuture();
      final selected =
          result.firstWhereOrNull((element) => element.name == selectedId);
      yield Success(viewModelList: result.toVM(selected: selected));
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
    _onSelectSubject.close();
    disposeAll();
  }
}
