part of '../page.dart';

class _QrSection extends StatelessWidget {
  const _QrSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state.item != null) {
              final item = state.item!;
              return Column(
                children: [
                  QrImageView(
                    data: item.qrString,
                    version: QrVersions.auto,
                    size: Dimens.dp200,
                  ),
                  Dimens.dp24.height,
                  _buildTile('Jumlah pesanan', '${item.items.length}'),
                  Dimens.dp8.height,
                  _buildTile('Subtotal', item.amount.toIDR()),
                  Dimens.dp8.height,
                  _buildTile('Pajak', 'IDR 0'),
                  Dimens.dp8.height,
                  _buildTile('Diskon', '- ${item.discount.toIDR()}',
                      isDisc: true),
                  const Divider(),
                  _buildTile(
                    'Total Tagihan',
                    item.total.toIDR(),
                    isBold: true,
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildTile(
    String title,
    String value, {
    bool isBold = false,
    bool isDisc = false,
  }) {
    return Row(
      children: [
        isBold
            ? RegularText.semiBold(
                title,
                style: const TextStyle(fontSize: Dimens.dp12),
              )
            : RegularText(
                title,
                style: const TextStyle(fontSize: Dimens.dp12),
              ),
        Expanded(
          child: RegularText.semiBold(
            value,
            style: TextStyle(
              fontSize: Dimens.dp12,
              color: isDisc ? AppColors.green : null,
            ),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
