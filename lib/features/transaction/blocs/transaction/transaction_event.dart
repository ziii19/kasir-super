part of 'transaction_bloc.dart';

class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class GetTransactionEvent extends TransactionEvent {
  final TypeEnum? type;

  const GetTransactionEvent(this.type);

  @override
  List<Object?> get props => [type];
}

class CreateTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;

  const CreateTransactionEvent({required this.transaction});

  @override
  List<Object?> get props => [transaction];
}
