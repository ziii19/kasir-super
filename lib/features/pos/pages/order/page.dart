import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/home/blocs/blocs.dart';
import 'package:kasir_super/features/home/home.dart';
import 'package:kasir_super/features/pos/blocs/blocs.dart';
import 'package:kasir_super/features/pos/components/components.dart';
import 'package:kasir_super/features/pos/pages/payment/page.dart';
import 'package:kasir_super/features/transaction/blocs/transaction/transaction_bloc.dart';

part 'section/action_section.dart';
part 'section/order_section.dart';
part 'section/detail_section.dart';
part 'section/discount_section.dart';

class POSOrderPage extends StatefulWidget {
  const POSOrderPage({super.key});

  static const String routeName = 'pos/order';

  @override
  State<POSOrderPage> createState() => _POSOrderPageState();
}

class _POSOrderPageState extends State<POSOrderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if (state.carts.isEmpty) {
              return Navigator.pop(context);
            }
          },
        ),
        BlocListener<TransactionBloc, TransactionState>(
          listener: (context, state) {
            if (state.status == Status.apply) {
              context.read<BottomNavBloc>().add(const TapBottomNavEvent(1));
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainPage.routeName,
                (route) => false,
              );
            }
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Daftar Pesanan')),
        body: ListView(
          children: const [
            _OrderSection(),
            Divider(
              thickness: Dimens.dp8,
            ),
            _DetailSection(),
          ],
        ),
        bottomNavigationBar: const _ActionSection(),
      ),
    );
  }
}
