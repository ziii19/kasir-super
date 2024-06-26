part of 'transaction_bloc.dart';

class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class CreateQrTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;
  final String? referenceId;

  const CreateQrTransactionEvent({this.referenceId, required this.transaction});

  @override
  List<Object?> get props => [transaction, referenceId];
}

class GetDetailTransactionEvent extends TransactionEvent {
  final String referenceId;

  const GetDetailTransactionEvent({required this.referenceId});

  @override
  List<Object?> get props => [referenceId];
}

class CekQrTransactionEvent extends TransactionEvent {}

class GetTransactionEvent extends TransactionEvent {
  final TypeEnum? type;

  const GetTransactionEvent(this.type);

  @override
  List<Object?> get props => [type];
}

class CreateTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;
  final TypeEnum? type;
  final String? referenceId;

  const CreateTransactionEvent(this.transaction, {this.type, this.referenceId});

  @override
  List<Object?> get props => [transaction, type, referenceId];
}
