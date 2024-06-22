part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({
    required this.onTap,
    required this.port,
    required this.title,
  });

  final String title;
  final String port;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.dp24),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(Dimens.dp8),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 2),
            color: context.theme.shadowColor.withOpacity(.15),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText.semiBold(title),
                Dimens.dp8.height,
                RegularText(port),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: RegularText.semiBold(
              'Tes Cetak',
              style: TextStyle(
                color: context.theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
