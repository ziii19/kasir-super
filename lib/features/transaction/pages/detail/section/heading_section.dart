part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection({
    required this.item,
  });

  final TransactionModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText.semiBold('# ${item.referenceId}'),
        Dimens.dp8.height,
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.dp8,
            vertical: Dimens.dp4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: item.paymentType == PaymentType.cash
                ? AppColors.yellow
                : AppColors.green[200],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.paymentType == PaymentType.cash
                      ? AppColors.yellow[600]
                      : AppColors.green[600],
                ),
              ),
              Dimens.dp4.width,
              RegularText(
                item.paymentType.name.toUpperCase(),
                style: const TextStyle(
                    fontSize: Dimens.dp12, color: AppColors.black),
              ),
            ],
          ),
        ),
        Dimens.dp8.height,
        RegularText(
          item.createdAt.transaction,
          style: const TextStyle(fontSize: Dimens.dp12),
        )
      ],
    );
  }
}
