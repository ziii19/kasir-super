  part of '../page.dart';

  class _TypeSection extends StatelessWidget {
    const _TypeSection();

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          children: [
            _buildTile('Tipe Pembayaran', 'Tunai'),
            Dimens.dp8.height,
            _buildTile('Order ID', 'TRX-100-10102030405'),
          ],
        ),
      );
    }

    Widget _buildTile(String title, String value) {
      return Row(
        children: [
          Expanded(
            child: RegularText(
              title,
              style: const TextStyle(fontSize: Dimens.dp12),
            ),
          ),
          RegularText.semiBold(
            value,
            style: const TextStyle(fontSize: Dimens.dp12),
          ),
        ],
      );
    }
  }
