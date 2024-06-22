part of '../page.dart';

class _ConfirmSection extends StatelessWidget {
  const _ConfirmSection({
    required this.nominal,
  });

  final num nominal;

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
        child: BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state.status == Status.apply) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            SuccessTransactionPage.routeName,
            (route) => false,
          );
        }
      },
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegularText.semiBold('Selesaikan Pembayaran'),
              Dimens.dp16.height,
              RegularText('Anda akan menyelesaikan pembayaran dengan nilai '
                  'transaksi sebesar ${state.getEstimate.toIDR()}.'),
              Dimens.dp24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularText.semiBold('Uang Diterima'),
                  RegularText.semiBold(nominal.toIDR()),
                ],
              ),
              Dimens.dp8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularText.semiBold(
                    'Kembalian',
                    style: TextStyle(color: AppColors.red[500]),
                  ),
                  RegularText.semiBold(
                    (nominal - state.discount).toIDR(),
                    style: TextStyle(color: AppColors.red[500]),
                  ),
                ],
              ),
              Dimens.dp16.height,
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context
                          .read<TransactionBloc>()
                          .add(CreateTransactionEvent(
                              transaction: state.transaction(
                            TypeEnum.paid,
                            payAmount: nominal,
                            paymentType: PaymentType.cash,
                          )));
                    },
                    child: const Text('Konfirmasi'),
                  );
                },
              )
            ],
          );
        },
      ),
    ));
  }
}
