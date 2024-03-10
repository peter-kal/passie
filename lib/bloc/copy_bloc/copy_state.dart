part of 'copy_bloc.dart';

sealed class CopyState extends Equatable {
  const CopyState();

  @override
  List<Object> get props => [];
}

final class CopyInitial extends CopyState {}

class CopiedMaterialState extends CopyState {
  const CopiedMaterialState();

  @override
  List<Object> get props => [];
}
