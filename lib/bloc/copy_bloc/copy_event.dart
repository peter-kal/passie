part of 'copy_bloc.dart';

sealed class CopyEvent extends Equatable {
  const CopyEvent();

  @override
  List<Object> get props => [];
}

class CopyButtonClicked extends CopyEvent {
  const CopyButtonClicked(this.copy_material);

  final String copy_material;

  @override
  List<Object> get props => [copy_material];
}

class ResetStateEvent extends CopyEvent {}
