import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pagenavigation_event.dart';
part 'pagenavigation_state.dart';

class PagenavigationBloc
    extends Bloc<PagenavigationEvent, PagenavigationState> {
  PagenavigationBloc() : super(PagenavigationInitial()) {
    on<PasswordPageEvent>(_onPasswordPageEvent);
    on<SettingsPageEvent>(_onSettingsPageEvent);
  }

  void _onSettingsPageEvent(
      SettingsPageEvent event, Emitter<PagenavigationState> emit) {
    emit(SettingsPageState());
  }

  void _onPasswordPageEvent(
      PasswordPageEvent event, Emitter<PagenavigationState> emit) {
    emit(PasswordPageState());
  }
}
