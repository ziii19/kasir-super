import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/features/product/pages/pages.dart';

import '../../../../core/core.dart';
import '../../../transaction/blocs/blocs.dart';
import '../../pos.dart';

part 'section/price_section.dart';
part 'section/confirm_section.dart';

class CashPage extends StatefulWidget {
  const CashPage({super.key});

  static const routeName = '/pos/cash';

  @override
  State<CashPage> createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran Tunai')),
      body: ListView(
        children: [
          const _PriceSection(),
          const Divider(
            thickness: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: Column(
              children: [
                RegularTextInput(
                  controller: controller,
                  hintText: 'Rp. 0',
                  label: 'Masukan Nominal',
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: ElevatedButton(
              onPressed: state.isValidCash(controller.text) ? confirmBtn : null,
              child: const Text('Tagih'),
            ),
          );
        },
      ),
    );
  }

  void confirmBtn() {
    showModalBottomSheet(
      context: context,
      builder: (context) => _ConfirmSection(
        nominal: num.tryParse(controller.text) ?? 0,
      ),
    );
  }
}
