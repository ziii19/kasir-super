import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/features/home/home.dart';
import 'package:kasir_super/features/product/pages/pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/core.dart';
import '../../../transaction/blocs/blocs.dart';

part 'section/qr_section.dart';

class POSQrPage extends StatelessWidget {
  const POSQrPage({super.key});

  static const routeName = 'transaction/qr';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: Navigator.canPop(context),
      onPopInvoked: (didPop) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainPage.routeName,
          (route) => false,
        );
      },
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state.status == Status.success &&
              state.item?.type == TypeEnum.paid) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SuccessTransactionPage.routeName,
              arguments: state.item!.referenceId,
              (route) => false,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Kode Pembayaran')),
          body: ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: const [
              _QrSection(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: ElevatedButton(
              onPressed: () {
                context.read<TransactionBloc>().add(CekQrTransactionEvent());
              },
              child: const Text(
                'Cek Status Pembayaran',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
