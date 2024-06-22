part of '../page.dart';

class _FilterSections extends StatefulWidget {
  const _FilterSections();

  @override
  State<_FilterSections> createState() => _FilterSectionsState();
}

class _FilterSectionsState extends State<_FilterSections> {
  TypeEnum? selected;

  @override
  void initState() {
    getData();
    super.initState();
  }
  void getData() {
    context.read<TransactionBloc>().add(GetTransactionEvent(selected));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [_buildContainer(context)] +
            TypeEnum.values
                .map(
                  (e) => _buildContainer(context, label: e),
                )
                .toList());
  }

  Widget _buildContainer(
    BuildContext context, {
    TypeEnum? label,
  }) {
    final isActive = selected == label;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () {
          setState(() {
            selected = label;
          });
          getData();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.defaultSize,
            vertical: Dimens.dp8,
          ),
          decoration: BoxDecoration(
            color: isActive ? context.theme.primaryColor : null,
            borderRadius: BorderRadius.circular(Dimens.dp8),
            border: Border.all(
              color:
                  isActive ? context.theme.primaryColor : AppColors.black[200]!,
            ),
          ),
          child: RegularText.semiBold(
            label?.valueName ?? 'All',
            style: TextStyle(
              fontSize: Dimens.dp12,
              color: isActive
                  ? context.theme.scaffoldBackgroundColor
                  : AppColors.black[200],
            ),
          ),
        ),
      ),
    );
  }
}
