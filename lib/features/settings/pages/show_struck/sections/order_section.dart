part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubtitleText('Pesanan'),
          const Divider(),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText.semiBold('Organic Potato'),
                        Dimens.dp4.height,
                        const RegularText(
                          'Rp 18.900',
                          style: TextStyle(fontSize: Dimens.dp12),
                        )
                      ],
                    ),
                  ),
                  RegularText.semiBold('2x'),
                ],
              );
            },
            separatorBuilder: (context, index) => Dimens.dp16.height,
            itemCount: 2,
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: RegularText.semiBold(
                  'Subtotal',
                  style: const TextStyle(fontSize: Dimens.dp12),
                ),
              ),
              RegularText.semiBold(
                'Rp 44.800',
                style: const TextStyle(fontSize: Dimens.dp12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
