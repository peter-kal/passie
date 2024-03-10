import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'copy_event.dart';
part 'copy_state.dart';

class CopyBloc extends Bloc<CopyEvent, CopyState> {
  CopyBloc() : super(CopyInitial()) {
    on<CopyButtonClicked>((CopyButtonClicked event, Emitter<CopyState> emit) {
      final copy = ClipboardData(text: event.copy_material);
      Clipboard.setData(copy);
      emit(CopiedMaterialState());
    });
    on<ResetStateEvent>((ResetStateEvent event, Emitter<CopyState> emit) {
      emit(CopyInitial());
    });
  }
}
