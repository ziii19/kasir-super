part of '../page.dart';

class _InfoSection extends StatefulWidget {
  const _InfoSection({this.product});

  final ProductModel? product;

  @override
  State<_InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<_InfoSection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    nameController.addListener(() {
      context
          .read<FormProductBloc>()
          .add(ChangeFormProductEvent(name: nameController.text));
    });
    descController.addListener(() {
      context
          .read<FormProductBloc>()
          .add(ChangeFormProductEvent(description: descController.text));
    });

    nameController.text = widget.product?.name ?? '';
    descController.text = widget.product?.desc ?? '';

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText.medium('Produk Info'),
          Dimens.dp24.height,
          RegularTextInput(
            label: 'Judul Produk',
            hintText: 'Masukan Judul Produk',
            required: true,
            controller: nameController,
          ),
          Dimens.dp24.height,
          RegularTextInput(
            label: 'Deskripsi',
            hintText: 'Masukan Deskripsi Produk',
            required: true,
            controller: descController,
          ),
          Dimens.dp24.height,
          const LabelInput(
            label: 'Media',
            required: true,
          ),
          Dimens.dp8.height,
          const RegularText(
            'Maks. ukuran 3 MB',
            style: TextStyle(
              fontSize: Dimens.dp12,
            ),
          ),
          Dimens.dp8.height,
          InkWell(
            onTap: () {
              context
                  .read<FormProductBloc>()
                  .add(ChangeImageFormProductEvent());
            },
            child: BlocBuilder<FormProductBloc, FormProductState>(
              builder: (context, state) {
                if (state.image != null && state.image!.isNotEmpty) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.dp8),
                    child: Image.memory(
                      ImageHelper.convertToUint8List(state.image!),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return Container(
                  padding: const EdgeInsets.all(Dimens.dp16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.dp8),
                    border: Border.all(color: context.theme.dividerColor),
                  ),
                  child: Icon(
                    AppIcons.addPhotoAlternate,
                    color: context.theme.primaryColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
