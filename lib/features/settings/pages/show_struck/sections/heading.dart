part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        children: [
          SubtitleText(
            AppConfig.appName,
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
