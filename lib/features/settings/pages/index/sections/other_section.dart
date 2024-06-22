part of '../page.dart';

class _OtherSection extends StatelessWidget {
  const _OtherSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: RegularText.semiBold('Info Lainnya'),
        ),
        ItemMenuSetting(
          title: 'Kebijakan Privasi',
          icon: AppIcons.verified,
          onTap: () {},
        ),
        const Divider(
          height: 0,
        ),
        ItemMenuSetting(
          title: 'Beri Rating',
          icon: AppIcons.star,
          onTap: () {},
        ),
      ],
    );
  }
}
