part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularText.semiBold('Pesanan'),
              const Divider(),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = state.item!.items[index];
                  return _buildTile(
                    item.title,
                    item.regularPrice.toIDR(),
                    '${item.qty}x',
                  );
                },
                separatorBuilder: (context, index) => Dimens.dp16.height,
                itemCount: state.item?.items.length ?? 0,
              ),
              const Divider(),
              Row(
                children: [
                  RegularText.semiBold(
                    'Subtotal',
                    style: const TextStyle(fontSize: Dimens.dp12),
                  ),
                  Expanded(
                    child: RegularText.semiBold(
                      '${state.item?.total.toIDR()}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildTile(String title, String price, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText.semiBold(title),
        Dimens.dp4.height,
        Row(
          children: [
            RegularText(
              price,
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
        ),
      ],
    );
  }
}
