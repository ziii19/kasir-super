part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.dp8),
            child: product.image.isNotEmpty
                ? Image.memory(
                    ImageHelper.convertToUint8List(product.image),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    'https://indonesiakaya.com/wp-content/uploads/2020/10/langsat1200.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )),
        Dimens.dp16.width,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText.semiBold(product.name),
            Dimens.dp8.height,
            RichText(
              text: TextSpan(
                text: product.regularPrice.toIDR(),
                style: context.theme.textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: '/ ${product.unit}',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Dimens.dp6.height,
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return CartProductButton(
                  count: state.findItem(product.id)?.qty ?? 0,
                  product: product,
                );
              },
            )
          ],
        ))
      ],
    );
  }
}
