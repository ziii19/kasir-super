import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/pos/pos.dart';

part 'section/price_section.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  static const routeName = '/pos/payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metode Pembayaran')),
      body: ListView(
        children: [
          const _PriceSection(),
          const Divider(thickness: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RegularText.semiBold('Pilih Metode Pembayaran'),
              ),
              _buildTile(
                icon: AppIcons.money,
                title: 'Tunai',
                onTap: () {
                  Navigator.pushNamed(context, CashPage.routeName);
                },
              ),
              _buildTile(
                icon: AppIcons.qrCode,
                title: 'QRIS',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTile({
    required String title,
    required IconData icon,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: Dimens.dp12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon),
            Dimens.dp16.width,
            Expanded(
                child: RegularText.semiBold(
              title,
              style: const TextStyle(fontSize: Dimens.dp12),
            )),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: Dimens.dp18,
            )
          ],
        ),
      ),
    );
  }
}
