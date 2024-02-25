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

class SwitchSymChangedEvent extends PassieEvent {
  const SwitchSymChangedEvent(this.newvalue);
  final bool newvalue;

  @override
  List<Object> get props => [newvalue];
}

class SwitchCapChangedEvent extends PassieEvent {
  const SwitchCapChangedEvent(this.newvalue);
  final bool newvalue;

  @override
  List<Object> get props => [newvalue];
}

class SwitchLowChangedEvent extends PassieEvent {
  const SwitchLowChangedEvent(this.newvalue);
  final bool newvalue;

  @override
  List<Object> get props => [newvalue];
}

class SwitchNumChangedEvent extends PassieEvent {
  const SwitchNumChangedEvent(this.newvalue);
  final bool newvalue;

  @override
  List<Object> get props => [newvalue];
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
