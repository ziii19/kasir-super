part of '../page.dart';

class _DetailSection extends StatelessWidget {
  const _DetailSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularText.semiBold('Detail Transaksi'),
              const Divider(),
              _buildTile('Jumlah pesanan', '${state.item?.items.length}'),
              Dimens.dp8.height,
              _buildTile('Subtotal', '${state.item?.discount.toIDR()}'),
              Dimens.dp8.height,
              _buildTile('Pajak', 'IDR 0'),
              Dimens.dp8.height,
              _buildTile('Diskon', '- ${state.item?.discount.toIDR()}',
                  isDisc: true),
              const Divider(),
              _buildTile(
                'Total Tagihan',
                '${state.item?.total.toIDR()}',
                isBold: true,
              ),
              Dimens.dp8.height,
              _buildTile(
                'Total Pembayaran',
                '${state.item?.payAmount.toIDR()}',
                isBold: true,
              ),
              const Divider(),
              _buildTile(
                'Total Kembali',
                '${state.item?.cashback.toIDR()}',
                isBold: true,
                color: context.theme.colorScheme.error,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTile(
    String title,
    String value, {
    bool isBold = false,
    Color? color,
    bool isDisc = false,
  }) {
    return Row(
      children: [
        if (isBold)
          RegularText.semiBold(
            title,
            style: TextStyle(fontSize: Dimens.dp12, color: color),
          )
        else
          RegularText(
            title,
            style: const TextStyle(fontSize: Dimens.dp12),
          ),
        Expanded(
          child: RegularText.semiBold(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: Dimens.dp12, color: isDisc ? AppColors.green : color),
          ),
        ),
      ],
    );
  }
}
