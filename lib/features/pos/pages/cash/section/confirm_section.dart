part of '../page.dart';

class _ConfirmSection extends StatelessWidget {
  const _ConfirmSection({
    required this.nominal,
    this.referenceId,
  });

  final String? referenceId;

  final num nominal;

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
        child: BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            SuccessTransactionPage.routeName,
            (route) => false,
            arguments: state.item?.referenceId,
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
              RegularText(
                'Anda akan menyelesaikan pembayaran dengan nilai '
                'transaksi sebesar ${(state.getEstimate - state.afterDiscount).toIDR()}.',
              ),
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
                    (nominal - state.afterDiscount).toIDR(),
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
                              referenceId: referenceId,
                              type: TypeEnum.paid,
                              state.transaction(
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
