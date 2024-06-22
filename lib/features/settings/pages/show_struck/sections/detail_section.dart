part of '../page.dart';

class _DetailSection extends StatefulWidget {
  const _DetailSection();

  @override
  State<_DetailSection> createState() => _DetailSectionState();
}

class _DetailSectionState extends State<_DetailSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubtitleText('Detail Transaksi'),
          const Divider(),
          _buildTile('Jumlah pesanan', '3'),
          Dimens.dp8.height,
          _buildTile('Subtotal', 'Rp 49.000'),
          Dimens.dp8.height,
          _buildTile('Pajak', 'Rp 0'),
          Dimens.dp8.height,
          _buildTile('Diskon', '- Rp 4.200', isDiscount: true),
          const Divider(),
          _buildTile('Total Tagihan', 'Rp 44.800', isRegular: false),
          Dimens.dp8.height,
          _buildTile('Total Pembayaran', 'Rp 50.000', isRegular: false),
        ],
      ),
    );
  }

  Widget _buildTile(
    String title,
    String value, {
    isRegular = true,
    isDiscount = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: isRegular
              ? RegularText(
                  title,
                  style: const TextStyle(fontSize: Dimens.dp12),
                )
              : RegularText.semiBold(
                  title,
                  style: const TextStyle(fontSize: Dimens.dp12),
                ),
        ),
        RegularText.semiBold(
          value,
          style: TextStyle(
            fontSize: Dimens.dp12,
            color: isDiscount ? context.theme.primaryColor : null,
          ),
        ),
      ],
    );
  }
}
