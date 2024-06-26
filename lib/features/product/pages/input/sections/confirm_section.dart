part of '../page.dart';

class _ConfirmSection extends StatelessWidget {
  const _ConfirmSection();

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
        child: Column(
      children: [
        Dimens.dp24.height,
        Image.asset(
          MainAssets.success2,
        ),
        Dimens.dp24.height,
        RegularText.semiBold(
          'Produk Berhasil Ditambahkan',
          style: const TextStyle(fontSize: Dimens.dp16),
        ),
        Dimens.dp16.height,
        RegularText(
          'Produk kamu akan segera tampil di\naplikasi pembeli',
          style: TextStyle(color: context.theme.disabledColor),
          textAlign: TextAlign.center,
        ),
        Dimens.dp32.height,
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  context
                      .read<BottomNavBloc>()
                      .add(const TapBottomNavEvent(3));
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    MainPage.routeName,
                    (route) => false,
                  );
                },
                child: const Text('OK'))),
      ],
    ));
  }
}

