import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/template/empty_template.dart';
import 'package:kasir_super/features/transaction/blocs/transaction/transaction_bloc.dart';
import 'package:kasir_super/features/transaction/models/models.dart';
import 'package:kasir_super/features/transaction/pages/detail/page.dart';
import '../../../../core/core.dart';

part 'sections/filter_section.dart';
part 'sections/item_section.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(Dimens.defaultSize),
            child: _FilterSections(),
          ),
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state.transactions.isEmpty) {
                return const EmptyTemplate();
              }
              return Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = state.transactions[index];
                  return _ItemSection(item);
                },
                itemCount: state.transactions.length,
              ));
            },
          ),
        ],
      ),
    );
  }
}
