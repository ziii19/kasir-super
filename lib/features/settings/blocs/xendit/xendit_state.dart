part of 'xendit_bloc.dart';

class XenditState extends Equatable {
  const XenditState({
    this.error,
    this.key = 'default',
    this.status = Status.initial,
  });

  factory XenditState.initial() {
    return const XenditState();
  }

  final Status status;
  final String key;
  final String? error;

  XenditState copyWith({
    Status? status,
    String? key,
    String? error,
  }) {
    return XenditState(
      error: error,
      key: key ?? this.key,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [error, key, status];
}
