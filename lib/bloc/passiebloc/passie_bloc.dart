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
    on<CheckBoxChanged>(_onCheckBoxChanged);

    on<FilledButtonForPasswordClickedEvent>(
        _onFilledButtonForPasswordClickedEvent);
    on<RestoreButtonForSymsClickedEvent>(_onRestoreButtonForSymsClickedEvent);
  }

  void _onFilledButtonForPasswordClickedEvent(
      FilledButtonForPasswordClickedEvent event, Emitter<PassieState> emit) {
    final state = this.state;

    if (state is LoadedState) {
      if ((state.default4Nums == false) &
          (state.default4Low == false) &
          (state.default4Syms == false) &
          (state.default4Caps == false)) {
        emit(LoadedState(
            state.default4Nums,
            state.default4Low,
            state.default4Caps,
            state.default4Syms,
            state.defaultLength,
            state.symbols,
            ':('));
      } else {
        final String thepass = Password(
            state.default4Nums,
            state.default4Syms,
            state.default4Caps,
            state.default4Low,
            state.defaultLength,
            state.symbols);
        emit(LoadedState(
            state.default4Nums,
            state.default4Low,
            state.default4Caps,
            state.default4Syms,
            state.defaultLength,
            state.symbols,
            thepass));
      }
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
          state.default4Nums,
          state.default4Low,
          state.default4Caps,
          state.default4Syms,
          forlimits,
          state.symbols,
          state.thePasswordAtHand));
    }
  }

  void _onSymbolsChanged(SymbolsChanged event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      emit(LoadedState(
          state.default4Nums,
          state.default4Low,
          state.default4Caps,
          state.default4Syms,
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
          state.default4Nums,
          state.default4Low,
          state.default4Caps,
          state.default4Syms,
          state.defaultLength,
          '@!#{}[]":%^&*()',
          state.thePasswordAtHand));
    }
  }

  void _onCheckBoxChanged(CheckBoxChanged event, Emitter<PassieState> emit) {
    final state = this.state;
    if (state is LoadedState) {
      switch (event.whichone) {
        case 1:
          emit(LoadedState(
              event.newvalue,
              state.default4Low,
              state.default4Caps,
              state.default4Syms,
              state.defaultLength,
              state.symbols,
              state.thePasswordAtHand));
          break;
        case 2:
          emit(LoadedState(
              state.default4Nums,
              event.newvalue,
              state.default4Caps,
              state.default4Syms,
              state.defaultLength,
              state.symbols,
              state.thePasswordAtHand));
          break;
        case 3:
          emit(LoadedState(
              state.default4Nums,
              state.default4Low,
              event.newvalue,
              state.default4Syms,
              state.defaultLength,
              state.symbols,
              state.thePasswordAtHand));
          break;
        case 4:
          emit(LoadedState(
              state.default4Nums,
              state.default4Low,
              state.default4Caps,
              event.newvalue,
              state.defaultLength,
              state.symbols,
              state.thePasswordAtHand));
          break;
        default:
      }
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
