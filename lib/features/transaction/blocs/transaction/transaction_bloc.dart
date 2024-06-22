import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/transaction/transaction.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionState.initial()) {
    on<GetTransactionEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        final service = await TransactionServices.getAll(event.type);

        emit(state.copyWith(status: Status.success, transactions: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });

    on<CreateTransactionEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        await TransactionServices.insert(event.transaction);

        emit(state.copyWith(status: Status.apply));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
