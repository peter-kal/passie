part of 'pagenavigation_bloc.dart';

sealed class PagenavigationEvent extends Equatable {
  const PagenavigationEvent();

  @override
  List<Object> get props => [];
}

class PasswordPageEvent extends PagenavigationEvent {
  const PasswordPageEvent();

  @override
  List<Object> get props => [];
}

class SettingsPageEvent extends PagenavigationEvent {
  const SettingsPageEvent();

  @override
  List<Object> get props => [];
}
