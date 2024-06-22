part of 'xendit_bloc.dart';

class XenditEvent extends Equatable {
  const XenditEvent();

  @override
  List<Object> get props => [];
}

class GetXenditEvent extends XenditEvent {}

class SubmitXenditEvent extends XenditEvent {
  final String key;

  const SubmitXenditEvent(this.key);
  @override
  List<Object> get props => [key];
}
