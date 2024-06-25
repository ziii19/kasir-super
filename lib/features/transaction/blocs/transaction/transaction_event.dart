part of 'transaction_bloc.dart';

class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class CreateQrTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;

  const CreateQrTransactionEvent({required this.transaction});

  @override
  List<Object?> get props => [transaction];
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

  const CreateTransactionEvent(this.transaction, {this.type});

  @override
  List<Object?> get props => [transaction, type];
}
