part of 'pagenavigation_bloc.dart';

sealed class PagenavigationState extends Equatable {
  const PagenavigationState();

  @override
  List<Object> get props => [];
}

final class PagenavigationInitial extends PagenavigationState {}

class PasswordPageState extends PagenavigationState {}

class SettingsPageState extends PagenavigationState {}
