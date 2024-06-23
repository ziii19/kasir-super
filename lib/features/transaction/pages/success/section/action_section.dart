part of '../page.dart';

class _ActionSection extends StatelessWidget {
  const _ActionSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Cetak Struk')),
              ),
              Dimens.dp16.width,
              Expanded(
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Kirim Struk')),
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
      ),
    );
  }
}
