import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/core/extensions/date_extension.dart';

import '../../../home/blocs/blocs.dart';
import '../../../home/home.dart';
import '../../blocs/blocs.dart';

part 'section/heading_section.dart';
part 'section/action_section.dart';
part 'section/order_section.dart';
part 'section/type_section.dart';
part 'section/detail_section.dart';

class SuccessTransactionPage extends StatelessWidget {
  const SuccessTransactionPage({super.key, required this.referenceId});

  final String referenceId;

  static const routeName = 'transaction/success';

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: Navigator.canPop(context),
        onPopInvoked: (didPop) {
          context.read<BottomNavBloc>().add(const TapBottomNavEvent(1));
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainPage.routeName,
            (route) => false,
          );
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Transaksi Berhasil')),
          body: BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              return ListView(
                children: const [
                  _HeadingSection(),
                  Divider(thickness: 8),
                  _TypeSection(),
                  Divider(thickness: 8),
                  _OrderSection(),
                  Divider(thickness: 8),
                  _DetailSection(),
                ],
              );
            },
          ),
          bottomNavigationBar: const _ActionSection(),
        ));
  }
}
