part of '../page.dart';

class _ActionSection extends StatefulWidget {
  const _ActionSection();

  @override
  State<_ActionSection> createState() => _ActionSectionState();
}

class _ActionSectionState extends State<_ActionSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          if (state.item != null) {
                            context
                                .read<PrinterBloc>()
                                .add(TransactionPrinterEvent(state.item!));
                          }
                        },
                        child: const Text('Cetak Struk')),
                  ),
                  Dimens.dp16.width,
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          share(state.item!);
                        },
                        child: const Text('Kirim Struk')),
                  ),
                ],
              ),
              Dimens.dp16.height,
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      MainPage.routeName,
                      (route) => false,
                    );
                  },
                  child: const Text('Transaksi Baru'))
            ],
          );
        },
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
