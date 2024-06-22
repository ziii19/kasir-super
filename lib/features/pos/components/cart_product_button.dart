import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/features/product/models/model.dart';

import '../../../core/core.dart';
import '../blocs/blocs.dart';

class CartProductButton extends StatelessWidget {
  const CartProductButton({
    super.key,
    this.count = 3,
    this.onNoted,
    required this.product,
  });

  final int count;
  final Function()? onNoted;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (onNoted != null) ...[
          _buildButton(
            context,
            onTap: () {},
            text: RegularText.medium(
              '+ Catatan',
              style: TextStyle(
                color: context.theme.primaryColor,
              ),
            ),
          ),
          const Spacer(),
        ],
        if (count > 0) ...[
          _buildButton(
            context,
            onTap: () {
              context.read<CartBloc>().add(DecrementCartEvent(product));
            },
          ),
          Dimens.dp12.width,
          RegularText.semiBold(count.toString()),
          Dimens.dp12.width,
          _buildButton(
            context,
            onTap: () {
              context.read<CartBloc>().add(IncrementCartEvent(product));
            },
            isIncrement: true,
          ),
        ] else ...[
          _buildButton(context, onTap: () {
            context.read<CartBloc>().add(IncrementCartEvent(product));
          },
              text: RegularText.semiBold(
                'Tambah',
                style: TextStyle(color: context.theme.primaryColor),
              )),
        ],
      ],
    );
  }

  Widget _buildButton(
    BuildContext context, {
    bool isIncrement = false,
    required Function() onTap,
    Widget? text,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Dimens.dp4),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimens.dp4,
          horizontal: count > 0 ? Dimens.dp4 : Dimens.dp12,
        ),
        decoration: BoxDecoration(
            color: isIncrement ? context.theme.primaryColor : null,
            borderRadius: BorderRadius.circular(Dimens.dp4),
            border: Border.all(color: context.theme.primaryColor)),
        child: text ??
            Icon(
              isIncrement ? Icons.add : Icons.remove,
              color: isIncrement
                  ? context.theme.scaffoldBackgroundColor
                  : context.theme.primaryColor,
              size: Dimens.dp22,
            ),
      ),
    );
  }
}
