part of '../page.dart';

class _UnitSection extends StatefulWidget {
  const _UnitSection();

  @override
  State<_UnitSection> createState() => _UnitSectionState();
}

class _UnitSectionState extends State<_UnitSection> {
  UnitType? selected;

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: UnitType.values
              .map(
                (e) => _buildItem(
                  title: e.valueName,
                  onTap: () {
                    setState(() {
                      selected = e;
                    });
                    Future.delayed(const Duration(milliseconds: 200), () {
                      Navigator.pop(context, e);
                    });
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  InkWell _buildItem({
    required String title,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegularText.medium(
              title,
              style: const TextStyle(fontSize: Dimens.dp16),
            ),
          ],
        ),
      ),
    );
  }
}
