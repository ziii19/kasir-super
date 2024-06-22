part of '../page.dart';

class _StockSection extends StatefulWidget {
  const _StockSection({this.product});

  final ProductModel? product;

  @override
  State<_StockSection> createState() => _StockSectionState();
}

class _StockSectionState extends State<_StockSection> {
  TextEditingController skuController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  @override
  void initState() {
    skuController.addListener(() {
      context
          .read<FormProductBloc>()
          .add(ChangeFormProductEvent(sku: skuController.text));
    });
    stockController.addListener(() {
      context.read<FormProductBloc>().add(
          ChangeFormProductEvent(stock: int.tryParse(stockController.text)));
    });

    skuController.text = widget.product?.sku ?? '';
    stockController.text = "${widget.product?.stock ?? ''}";
    super.initState();
  }

  @override
  void dispose() {
    skuController.dispose();
    stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        children: [
          RegularTextInput(
            hintText: 'SKU (Stock Keeping Unit)',
            label: 'SKU (Stock Keeping Unit)',
            controller: skuController,
          ),
          Dimens.dp24.height,
          RegularTextInput(
            hintText: '100',
            label: 'Total Stock',
            controller: stockController,
          ),
          Dimens.dp24.height,
        ],
      ),
    );
  }
}
