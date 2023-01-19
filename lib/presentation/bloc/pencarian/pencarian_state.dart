part of 'pencarian_bloc.dart';

abstract class PencarianState extends Equatable {
  const PencarianState();
  
  @override
  List<Object> get props => [];
}

class PencarianLoading extends PencarianState {}

class PencarianEmpty extends PencarianState {}

class PencarianError extends PencarianState {
  final String message;

  const PencarianError(this.message);

  @override
  List<Object> get props => [message];
}

class PencarianHasData extends PencarianState {
  final List<Comic> result;

  const PencarianHasData(this.result);

  @override
  List<Object> get props => [result];
}
