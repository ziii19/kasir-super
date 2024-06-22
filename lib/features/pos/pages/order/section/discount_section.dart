part of '../page.dart';

class _DiscountSection extends StatefulWidget {
  const _DiscountSection({required this.disc, required this.type});

  final DiscountType? type;
  final num? disc;
  @override
  State<_DiscountSection> createState() => _DiscountSectionState();
}

class _DiscountSectionState extends State<_DiscountSection> {
  TextEditingController controller = TextEditingController();
  DiscountType? type;

  @override
  void initState() {
    setState(() {
      controller.text = '${widget.disc ?? 0}';
      type = widget.type;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RegularText.semiBold('Pilih  Satuan Diskon'),
          Dimens.dp24.height,
          _buildLable('Nominal', DiscountType.nominal),
          if (type == DiscountType.nominal) ...[
            Dimens.dp8.height,
            RegularTextInput(
              hintText: 'Rp 2000',
              label: 'Jumlah',
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
          const Divider(
            height: Dimens.dp32,
          ),
          _buildLable('Persentase', DiscountType.percentage),
          if (type == DiscountType.percentage) ...[
            Dimens.dp8.height,
            RegularTextInput(
              hintText: '0%',
              label: 'Jumlah',
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
          const Divider(
            height: Dimens.dp32,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CartBloc>().add(ApplyDiscountCartEvent(
                    disc: num.tryParse(controller.text) ?? 0,
                    type: type,
                  ));
              Navigator.pop(context);
            },
            child: const Text('Terapkan'),
          ),
        ],
      ),
    );
  }

  Widget _buildLable(String title, DiscountType discType) {
    final isActive = type == discType;
    return GestureDetector(
      onTap: () {
        controller.clear();
        setState(() {
          type = discType;
        });
      },
      child: Row(
        children: [
          Expanded(
            child: RegularText.semiBold(
              title,
              style: const TextStyle(fontSize: Dimens.dp12),
            ),
          ),
          Container(
            width: Dimens.dp24,
            height: Dimens.dp24,
            padding: const EdgeInsets.all(Dimens.dp4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.theme.disabledColor.withOpacity(.2),
            ),
            child: isActive
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.theme.primaryColor,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
