part of '../page.dart';

class _PriceSection extends StatefulWidget {
  const _PriceSection({this.product});

  final ProductModel? product;

  @override
  State<_PriceSection> createState() => _PriceSectionState();
}

class _PriceSectionState extends State<_PriceSection> {
  TextEditingController priceReg = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    priceReg.addListener(() {
      context.read<FormProductBloc>().add(
          ChangeFormProductEvent(priceRegular: int.tryParse(priceReg.text)));
    });
    unitController.addListener(() {
      context
          .read<FormProductBloc>()
          .add(ChangeFormProductEvent(unit: unitController.text));
    });
    priceController.addListener(() {
      context.read<FormProductBloc>().add(ChangeFormProductEvent(
          priceItem: int.tryParse(priceController.text)));
    });

    priceReg.text = "${widget.product?.regularPrice ?? ''}";
    unitController.text = widget.product?.unit ?? '';
    priceController.text = "${widget.product?.price ?? ''}";

    super.initState();
  }

  @override
  void dispose() {
    priceReg.dispose();
    unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText.semiBold("Harga"),
          Dimens.dp24.height,
          Row(
            children: [
              Expanded(
                child: RegularTextInput(
                  hintText: 'Rp 0',
                  label: 'Harga Regular',
                  required: true,
                  controller: priceReg,
                ),
              ),
              Dimens.dp16.width,
              Expanded(
                flex: 1,
                child: RegularTextInput(
                  hintText: 'Pcs, kg, etc',
                  label: 'Unit',
                  controller: unitController,
                  required: true,
                ),
              ),
            ],
          ),
          Dimens.dp24.height,
          RegularTextInput(
            controller: priceController,
            label: 'Biaya Per Item',
            required: true,
            hintText: 'Rp 0',
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText.medium(
                      'Margin',
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                    Dimens.dp8.height,
                    const RegularText(
                      '-',
                      style: TextStyle(fontSize: Dimens.dp12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText.medium(
                      'Margin',
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                    Dimens.dp8.height,
                    const RegularText(
                      '-',
                      style: TextStyle(fontSize: Dimens.dp12),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
