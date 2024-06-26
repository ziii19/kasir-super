part of '../page.dart';

class _BtnSection extends StatelessWidget {
  const _BtnSection({
    required this.item,
  });

  final TransactionModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (item.type != TypeEnum.paid) ...[
              OutlinedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(
                          InitialCartEvent(transaction: item),
                        );

                    if (item.paymentType == PaymentType.qris) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        POSQrPage.routeName,
                        (route) => false,
                      );
                    } else {
                      Navigator.pushNamed(context, PaymentPage.routeName,
                          arguments: item.referenceId);
                    }
                  },
                  child: const Text('Bayar')),
              Dimens.dp24.height,
            ],
            OutlinedButton(onPressed: () {}, child: const Text('Kirim Struk')),
            Dimens.dp24.height,
            ElevatedButton(onPressed: () {}, child: const Text('Cetak Struk')),
          ],
        ),
      ),
    );
  }
}
