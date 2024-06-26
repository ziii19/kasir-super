part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection(this.data);

  final TransactionModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, TransactionDetailPage.routeName,
            arguments: data.referenceId);
      },
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.dp12,
                    vertical: Dimens.dp4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.dp4),
                    border: Border.all(
                      color: data.type == TypeEnum.paid
                          ? context.theme.primaryColor
                          : context.theme.disabledColor,
                    ),
                  ),
                  child: RegularText.semiBold(
                    data.type.valueName,
                    style: TextStyle(
                      color: data.type == TypeEnum.paid
                          ? context.theme.primaryColor
                          : context.theme.disabledColor,
                      fontSize: Dimens.dp10,
                    ),
                  ),
                ),
                Expanded(
                  child: RegularText.semiBold(
                    data.createdAt.transaction,
                    style: const TextStyle(fontSize: Dimens.dp10),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            Dimens.dp16.height,
            RegularText.semiBold(
              '${data.paymentType.valueName} • ${data.referenceId}',
            ),
            Dimens.dp8.height,
            RegularText.semiBold(
              data.total.toIDR(),
              style: TextStyle(color: context.theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
