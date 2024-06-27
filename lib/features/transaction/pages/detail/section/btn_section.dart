part of '../page.dart';

class _BtnSection extends StatefulWidget {
  const _BtnSection({
    required this.item,
  });

  final TransactionModel item;

  @override
  State<_BtnSection> createState() => _BtnSectionState();
}

class _BtnSectionState extends State<_BtnSection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.item.type != TypeEnum.paid) ...[
              OutlinedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(
                          InitialCartEvent(transaction: widget.item),
                        );

                    if (widget.item.paymentType == PaymentType.qris) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        POSQrPage.routeName,
                        (route) => false,
                      );
                    } else {
                      Navigator.pushNamed(context, PaymentPage.routeName,
                          arguments: widget.item.referenceId);
                    }
                  },
                  child: const Text('Bayar')),
              Dimens.dp24.height,
            ],
            OutlinedButton(
                onPressed: () {
                  share(widget.item);
                },
                child: const Text('Kirim Struk')),
            Dimens.dp24.height,
            ElevatedButton(
                onPressed: () {
                  context
                      .read<PrinterBloc>()
                      .add(TransactionPrinterEvent(widget.item));
                },
                child: const Text('Cetak Struk')),
          ],
        ),
      ),
    );
  }

  void share(TransactionModel transaction) {
    ScreenshotController()
        .captureFromWidget(
      pixelRatio: MediaQuery.of(context).devicePixelRatio,
      delay: const Duration(milliseconds: 10),
      ShareBill(data: transaction),
      context: context,
      targetSize: Size(
        370,
        800 + (transaction.items.length * 50),
      ),
    )
        .then((capturedImage) async {
      await ShareHelper.shareImage(context, capturedImage, 'contoh');
    });
  }
}
