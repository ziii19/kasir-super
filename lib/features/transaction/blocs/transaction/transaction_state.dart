part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  const TransactionState({
    this.error,
    this.status = Status.initial,
    this.transactions = const [],
    this.item,
  });

  factory TransactionState.initial() {
    return const TransactionState();
  }

  final Status status;
  final String? error;
  final List<TransactionModel> transactions;
  final TransactionModel? item;

  TransactionState copyWith({
    Status? status,
    String? error,
    List<TransactionModel>? transactions,
    TransactionModel? item,
  }) {
    return TransactionState(
      error: error,
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      item: item ?? this.item,
    );
  }

  @override
  List<Object?> get props => [error, status, transactions, item];
}
