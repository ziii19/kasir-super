part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        children: [
          Image.asset(MainAssets.success),
          Dimens.dp24.height,
          const SubtitleText('Transaksi Berhasil'),
          Dimens.dp4.height,
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              return RegularText(
                state.item?.createdAt.transaction ?? '',
              );
            },
          ),
        ],
      ),
    );
  }
}
