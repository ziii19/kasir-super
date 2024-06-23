part of '../page.dart';

class _TypeSection extends StatelessWidget {
  const _TypeSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildTile(
                'Tipe Pembayaran',
                '${state.item?.paymentType.valueName}',
              ),
              Dimens.dp8.height,
              _buildTile('Order ID', '${state.item?.referenceId}'),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTile(String title, String value) {
    return Row(
      children: [
        RegularText(
          title,
          style: const TextStyle(fontSize: Dimens.dp12),
        ),
        Expanded(
          child: RegularText.semiBold(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: Dimens.dp12),
          ),
        ),
      ],
    );
  }
}
