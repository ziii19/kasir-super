import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/core/extensions/date_extension.dart';
import 'package:kasir_super/features/transaction/models/transaction_model.dart';
import '../../blocs/blocs.dart';

part 'section/heading_section.dart';

class TransactionDetailPage extends StatefulWidget {
  const TransactionDetailPage({super.key, required this.referenceId});

  final String referenceId;

  static const routeName = 'transaction/detail';

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  @override
  void initState() {
    context
        .read<TransactionBloc>()
        .add(GetDetailTransactionEvent(referenceId: widget.referenceId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Transaksi')),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state.item != null) {
            final item = state.item!;
            return ListView(
              padding: const EdgeInsets.all(Dimens.dp16),
              children: [
                _HeadingSection(item: item),
                Card(
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: () {}, child: const Text('aaaaa')),
                      Dimens.dp24.height,
                      OutlinedButton(
                          onPressed: () {}, child: const Text('aaaaa')),
                      Dimens.dp24.height,
                      ElevatedButton(onPressed: () {}, child: const Text('')),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
