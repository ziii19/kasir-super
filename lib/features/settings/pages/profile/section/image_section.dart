part of '../page.dart';

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText.medium('Upload Logo'),
        Dimens.dp8.height,
        const RegularText(
          'Maks. ukuran 3 MB',
          style: TextStyle(fontSize: Dimens.dp12),
        ),
        Dimens.dp8.height,
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<ProfileBloc>().add(GetImageProfileEvent());
              },
              child: state.image != null && state.image!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(Dimens.dp8),
                      child: Image.memory(
                        ImageHelper.convertToUint8List(state.image!),
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(Dimens.dp16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.dp8),
                        border: Border.all(color: context.theme.dividerColor),
                      ),
                      child: Icon(
                        AppIcons.addPhotoAlternate,
                        color: context.theme.primaryColor,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
