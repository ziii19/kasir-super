part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  final ProductModel product;
  final Function() onEdit;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.defaultSize),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.dp8),
                child: product.image.isNotEmpty
                    ? Image.memory(
                        ImageHelper.convertToUint8List(product.image),
                        width: 74,
                        height: 74,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqHaXzMVA1dJ35qepzaPrg9djcVxjlgwlzp2lDkc66hA&s',
                        width: 74,
                        height: 74,
                        fit: BoxFit.cover,
                      ),
              ),
              Dimens.dp12.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText.semiBold(product.name),
                    Dimens.dp4.height,
                    RegularText.semiBold(
                        '${product.regularPrice} / ${product.unit}'),
                  ],
                ),
              ),
            ],
          ),
          Dimens.dp16.height,
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onEdit,
                  child: const Text('Edit'),
                ),
              ),
              Dimens.dp16.width,
              Expanded(
                child: OutlinedButton(
                  onPressed: onDelete,
                  child: const Text('Delete'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
