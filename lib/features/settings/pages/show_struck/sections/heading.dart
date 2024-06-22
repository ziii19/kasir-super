part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        children: [
          const SubtitleText(
            'Kasir SUPER',
            textAlign: TextAlign.center,
          ),
          Dimens.dp16.height,
          const RegularText(
            'Instagram : @superpos.id',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
