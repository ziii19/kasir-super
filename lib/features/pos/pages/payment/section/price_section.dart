part of '../page.dart';

class _PriceSection extends StatelessWidget {
  const _PriceSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText.semiBold('Nilai Transaksi'),
          Dimens.dp8.height,
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return HeadingText(
                (state.afterDiscount).toIDR(),
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontSize: Dimens.dp24,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
