part of 'passie_bloc.dart';

abstract class PassieEvent extends Equatable {
  const PassieEvent();

  @override
  List<Object> get props => [];
}

class LoadOptions extends PassieEvent {
  const LoadOptions();
  final int defautLenght = 15;
  final bool default4Symbols = true;
  final bool default4Numbers = true;
  final bool default4CapLetters = true;
  final bool default4LowLetters = true;
  final String defaultsymbols = '@!#{}[]":%^&*()';
  final String defaultPass = '';

  @override
  List<Object> get props => [];
}

class LengthChangedEvent extends PassieEvent {
  const LengthChangedEvent(this.newlengthevent);

  final int newlengthevent;

  @override
  List<Object> get props => [newlengthevent];
}

class CheckBoxChanged extends PassieEvent {
  const CheckBoxChanged(this.newvalue, this.whichone);

  final bool newvalue;
  final int whichone;

  @override
  List<Object> get props => [newvalue, whichone];
}

class FilledButtonForPasswordClickedEvent extends PassieEvent {
  const FilledButtonForPasswordClickedEvent();
  @override
  List<Object> get props => [];
}

class RestoreButtonForSymsClickedEvent extends PassieEvent {
  const RestoreButtonForSymsClickedEvent();
  @override
  List<Object> get props => [];
}

class SymbolsChanged extends PassieEvent {
  const SymbolsChanged(this.newsyms);
  final String newsyms;
  @override
  List<Object> get props => [newsyms];
}
