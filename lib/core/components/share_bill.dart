import 'package:flutter/material.dart';
import 'package:kasir_super/core/core.dart';

import '../../features/transaction/transaction.dart';

class ShareBill extends StatefulWidget {
  const ShareBill({super.key, required this.data});

  final TransactionModel data;

  @override
  State<ShareBill> createState() => _ShareBillState();
}

class _ShareBillState extends State<ShareBill> {
  @override
  Widget build(BuildContext context) {
    final redColor = context.theme.colorScheme.error;
    return Container(
      width: 370,
      height: 800 + (widget.data.items.length * 50),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: Column(
              children: [
                Image.asset(MainAssets.success2, width: 100),
                Dimens.dp24.height,
                const SubtitleText('Transaksi Berhasil',
                    textAlign: TextAlign.center),
                Dimens.dp4.height,
                RegularText(
                  widget.data.createdAt.transaction,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RegularText(
                      'Tipe Pembayaran',
                      style: TextStyle(fontSize: Dimens.dp12),
                    ),
                    RegularText.semiBold(
                      widget.data.paymentType.valueName,
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                  ],
                ),
                Dimens.dp8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RegularText(
                      'Order ID',
                      style: TextStyle(fontSize: Dimens.dp12),
                    ),
                    RegularText.semiBold(
                      widget.data.referenceId,
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText.semiBold('Pesanan'),
                Dimens.dp16.height,
                const Divider(thickness: 1, height: 1),
                Dimens.dp16.height,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = widget.data.items[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText.semiBold(item.title),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RegularText(
                              item.regularPrice.toIDR(),
                              style: const TextStyle(fontSize: Dimens.dp12),
                            ),
                            RegularText.semiBold(
                              '${item.qty}x',
                              style: const TextStyle(fontSize: Dimens.dp12),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Dimens.dp16.height,
                  itemCount: widget.data.items.length,
                ),
                Dimens.dp16.height,
                const Divider(),
                Dimens.dp16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularText.semiBold(
                      'Subtotal',
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                    RegularText.semiBold(
                      widget.data.amount.toIDR(),
                      style: const TextStyle(fontSize: Dimens.dp12),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText.semiBold('Detail Transaksi'),
                Dimens.dp16.height,
                const Divider(thickness: 1, height: 1),
                Dimens.dp12.height,
                _buildTile('Jumlah pesanan', '${widget.data.items.length}'),
                _buildTile('Subtotal', widget.data.amount.toIDR()),
                _buildTile('Pajak', 'Rp 0'),
                _buildTile(
                  'Diskon',
                  '- ${widget.data.discount.toIDR()}',
                  color: context.theme.primaryColor,
                ),
                Dimens.dp12.height,
                Dimens.dp12.height,
                _buildTile('Total Tagihan',
                    (widget.data.amount - widget.data.discount).toIDR(),
                    isBold: true),
                _buildTile('Total Pembayaran', widget.data.payAmount.toIDR(),
                    isBold: true),
                Dimens.dp12.height,
                const Divider(),
                Dimens.dp16.height,
                Row(
                  children: [
                    RegularText.semiBold(
                      'Total Kembali',
                      style: TextStyle(fontSize: Dimens.dp12, color: redColor),
                    ),
                    Dimens.dp8.width,
                    Expanded(
                      child: RegularText.semiBold(
                        (widget.data.payAmount -
                                (widget.data.amount - widget.data.discount))
                            .toIDR(),
                        textAlign: TextAlign.end,
                        style:
                            TextStyle(fontSize: Dimens.dp12, color: redColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Dimens.dp16.height,
        ],
      ),
    );
  }

  Widget _buildTile(
    String title,
    String value, {
    Color? color,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.dp4),
      child: Row(
        children: [
          if (isBold)
            RegularText.semiBold(
              title,
              style: const TextStyle(fontSize: Dimens.dp12),
            )
          else
            RegularText(
              title,
              style: const TextStyle(fontSize: Dimens.dp12),
            ),
          Dimens.dp8.width,
          Expanded(
            child: RegularText.semiBold(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: Dimens.dp12, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
