part of '../page.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.dp50),
                child: state.user?.image != null && state.user!.image.isNotEmpty
                    ? Image.memory(
                        ImageHelper.convertToUint8List(state.user!.image),
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://cdn.antaranews.com/cache/1200x800/2023/06/18/20230618_080945.jpg',
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
              ),
              Dimens.dp16.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText.semiBold(
                        state.user?.name == null || state.user!.name.isEmpty
                            ? "Kasir SUPER"
                            : state.user!.name),
                    Dimens.dp4.height,
                    RegularText(
                      state.user?.name == null || state.user!.name.isEmpty
                          ? 'superpos@gmail.com'
                          : state.user!.name,
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                    Dimens.dp4.height,
                    RegularText(
                      state.user?.phoneNumber == null ||
                              state.user!.name.isEmpty
                          ? '+6283867246731'
                          : state.user!.phoneNumber,
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfilePage.routeName);
                  },
                  icon: Icon(
                    AppIcons.edit,
                    color: context.theme.primaryColor,
                  ))
            ],
          );
        },
      ),
    );
  }
}
