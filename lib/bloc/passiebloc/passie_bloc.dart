import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:passie/password.dart';

part '../passiebloc/passie_event.dart';
part '../passiebloc/passie_state.dart';

class PassieBloc extends Bloc<PassieEvent, PassieState> {
  PassieBloc() : super(const LoadingState()) {
    on<LoadOptions>(_onLoadingOptions);
    on<LengthChangedEvent>(_onLengtChangedEvent);
    on<SymbolsChanged>(_onSymbolsChanged);
    on<SwitchCapChangedEvent>(_onSwitchCapChangedEvent);
    on<SwitchNumChangedEvent>(_onSwitchNumChangedEvent);
    on<SwitchLowChangedEvent>(_onSwitchLowChangedEvent);
    on<SwitchSymChangedEvent>(_onSwitchSymChangedEvent);
    on<FilledButtonForPasswordClickedEvent>(
        _onFilledButtonForPasswordClickedEvent);
    on<RestoreButtonForSymsClickedEvent>(_onRestoreButtonForSymsClickedEvent);
  }

  void _onFilledButtonForPasswordClickedEvent(
      FilledButtonForPasswordClickedEvent event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      final String thepass = Password(
          state.default4Nums,
          state.default4Syms,
          state.default4Caps,
          state.default4Low,
          state.defaultLength,
          state.symbols);
      emit(LoadedState(
          state.default4Syms,
          state.default4Nums,
          state.default4Low,
          state.default4Caps,
          state.defaultLength,
          state.symbols,
          thepass));
    }
  }

  void _onSwitchCapChangedEvent(
      SwitchCapChangedEvent event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      emit(LoadedState(
          state.default4Syms,
          state.default4Nums,
          state.default4Low,
          event.newvalue,
          state.defaultLength,
          state.symbols,
          state.thePasswordAtHand));
    }
  }

  void _onSwitchNumChangedEvent(
      SwitchNumChangedEvent event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      emit(LoadedState(
          state.default4Syms,
          event.newvalue,
          state.default4Low,
          state.default4Caps,
          state.defaultLength,
          state.symbols,
          state.thePasswordAtHand));
    }
  }

  void _onSwitchLowChangedEvent(
      SwitchLowChangedEvent event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      emit(LoadedState(
          state.default4Syms,
          state.default4Nums,
          event.newvalue,
          state.default4Caps,
          state.defaultLength,
          state.symbols,
          state.thePasswordAtHand));
    }
  }

  void _onSwitchSymChangedEvent(
      SwitchSymChangedEvent event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      emit(LoadedState(
          event.newvalue,
          state.default4Nums,
          state.default4Low,
          state.default4Caps,
          state.defaultLength,
          state.symbols,
          state.thePasswordAtHand));
    }
  }

  void _onLengtChangedEvent(
      LengthChangedEvent event, Emitter<PassieState> emit) {
    final state = this.state;
    int forlimits = event.newlengthevent;
    if (forlimits > 100000) {
      forlimits = 100000;
    }
    if (forlimits < 5) {
      forlimits = 5;
    }

    if (state is LoadedState) {
      emit(LoadedState(
          state.default4Syms,
          state.default4Nums,
          state.default4Low,
          state.default4Caps,
          forlimits,
          state.symbols,
          state.thePasswordAtHand));
    }
  }

  void _onSymbolsChanged(SymbolsChanged event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      emit(LoadedState(
          state.default4Syms,
          state.default4Nums,
          state.default4Low,
          state.default4Caps,
          state.defaultLength,
          event.newsyms,
          state.thePasswordAtHand));
    }
  }

  void _onRestoreButtonForSymsClickedEvent(
      RestoreButtonForSymsClickedEvent event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      emit(LoadedState(
          state.default4Syms,
          state.default4Nums,
          state.default4Low,
          state.default4Caps,
          state.defaultLength,
          '@!#{}[]":%^&*()',
          state.thePasswordAtHand));
    }
  }
}

void _onLoadingOptions(LoadOptions event, Emitter<PassieState> emit) {
  emit(LoadedState(
      event.default4Symbols,
      event.default4Numbers,
      event.default4LowLetters,
      event.default4CapLetters,
      event.defautLenght,
      event.defaultsymbols,
      event.defaultPass));
}
