part of '../page.dart';

class _DetailSection extends StatelessWidget {
  const _DetailSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularText.semiBold('Detail Transaksi'),
              const Divider(),
              _buildItem(
                  title: 'Jumlah Pesanan', value: '${state.carts.length}'),
              _buildItem(title: 'Subtotal', value: state.getEstimate.toIDR()),
              _buildItem(title: 'Pajak', value: 'Rp 0'),
              _buildItem(title: 'Diskon', value: state.discount.toIDR()),
              const Divider(),
              _buildItem(
                title: 'Estimasi Tagihan',
                value: state.afterDiscount.toIDR(),
                isBold: true,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(
      {required String title, required String value, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.dp4),
      child: Row(
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
              style: const TextStyle(fontSize: Dimens.dp12),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
