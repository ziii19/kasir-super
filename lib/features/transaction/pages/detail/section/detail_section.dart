part of '../page.dart';

class _DetailSection extends StatefulWidget {
  const _DetailSection({required this.transaction});

  final TransactionModel transaction;

  @override
  State<_DetailSection> createState() => _DetailSectionState();
}

class _DetailSectionState extends State<_DetailSection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText.semiBold('Pesanan'),
            const Divider(height: Dimens.dp32),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = widget.transaction.items[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText.semiBold(item.title),
                    Dimens.dp14.height,
                    Row(
                      children: [
                        RegularText(
                          item.regularPrice.toIDR(),
                          style: const TextStyle(fontSize: Dimens.dp12),
                        ),
                        Expanded(
                          child: RegularText.semiBold(
                            '${item.qty}x',
                            style: const TextStyle(fontSize: Dimens.dp12),
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Dimens.dp16.height,
              itemCount: widget.transaction.items.length,
            ),
            const Divider(height: Dimens.dp32),
            _buildTile(
              'Jumlah pesanan',
              '${widget.transaction.items.length}',
            ),
            Dimens.dp8.height,
            _buildTile(
              'Subtotal',
              widget.transaction.amount.toIDR(),
            ),
            Dimens.dp8.height,
            _buildTile('Pajak', 'Rp 0'),
            Dimens.dp8.height,
            _buildTile(
              'Diskon',
              '- ${widget.transaction.discount.toIDR()}',
              isDiscount: true,
            ),
            Dimens.dp8.height,
            _buildTile(
              'Total',
              widget.transaction.total.toIDR(),
            ),
            const Divider(height: Dimens.dp32),
            _buildTile(
              'Dibayar',
              widget.transaction.payAmount.toIDR(),
              isRegular: false,
            ),
            Dimens.dp8.height,
            _buildTile(
              'Kembalian',
              (widget.transaction.payAmount -
                      (widget.transaction.amount - widget.transaction.discount))
                  .toIDR(),
              isRegular: false,
            ),
          ],
        ),
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
