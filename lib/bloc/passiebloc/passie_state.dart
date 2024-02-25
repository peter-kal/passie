part of 'passie_bloc.dart';

abstract class PassieState extends Equatable {
  const PassieState();

  @override
  List<Object> get props => [];
}

class LoadingState extends PassieState {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class LoadedState extends PassieState {
  const LoadedState(
      this.default4Nums,
      this.default4Low,
      this.default4Caps,
      this.default4Syms,
      this.defaultLength,
      this.symbols,
      this.thePasswordAtHand);
  final bool default4Syms;
  final bool default4Nums;
  final bool default4Low;
  final bool default4Caps;
  final int defaultLength;
  final String symbols;
  final String thePasswordAtHand;

  @override
  List<Object> get props => [
        default4Caps,
        default4Low,
        default4Nums,
        default4Syms,
        defaultLength,
        symbols,
        thePasswordAtHand
      ];
}
