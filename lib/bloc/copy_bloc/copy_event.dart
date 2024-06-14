part of 'copy_bloc.dart';

sealed class CopyEvent extends Equatable {
  const CopyEvent();

  @override
  List<Object> get props => [];
}

class CopyButtonClicked extends CopyEvent {
  const CopyButtonClicked(this.copiedMaterial);

  final String copiedMaterial;

  @override
  List<Object> get props => [copiedMaterial];
}

class ResetStateEvent extends CopyEvent {}
