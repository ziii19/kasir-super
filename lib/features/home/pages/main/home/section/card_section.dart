part of '../page.dart';

class _CardSection extends StatelessWidget {
  const _CardSection({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText(title),
            Dimens.dp4.height,
            HeadingText(
              value,
              style: const TextStyle(fontSize: Dimens.dp24),
            ),
            Dimens.dp6.height,
            RegularText.semiBold(
              'Lihat Detail',
              style: TextStyle(
                fontSize: Dimens.dp12,
                color: context.theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
