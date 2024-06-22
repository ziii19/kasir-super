part of 'struck_bloc.dart';

sealed class StruckEvent extends Equatable {
  const StruckEvent();

  @override
  List<Object> get props => [];
}

class GetStruckEvent extends StruckEvent {}

class SubmitStruckEvent extends StruckEvent {
  final String desc;
  final String message;

  const SubmitStruckEvent({required this.desc, required this.message});
  @override
  List<Object> get props => [desc, message];
}
