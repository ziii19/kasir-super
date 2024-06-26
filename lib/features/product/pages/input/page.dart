import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/home/blocs/blocs.dart';
import 'package:kasir_super/features/home/home.dart';
import 'package:kasir_super/features/product/blocs/blocs.dart';
import 'package:kasir_super/features/product/models/model.dart';

part 'sections/info_section.dart';
part 'sections/price_section.dart';
part 'sections/stock_section.dart';
part 'sections/confirm_section.dart';

class ProductInputPage extends StatefulWidget {
  const ProductInputPage({super.key, this.product});

  final ProductModel? product;

  static const routeName = '/produk/input';

  @override
  State<ProductInputPage> createState() => _ProductInputPageState();
}

class _ProductInputPageState extends State<ProductInputPage> {
  @override
  void initState() {
    context
        .read<FormProductBloc>()
        .add(InitialFormProductEvent(image: widget.product?.image));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.status == Status.apply) {
          confirmBtn();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.product != null ? 'Edit Produk' : 'Tambah Produk'),
        ),
        body: ListView(
          children: [
            _InfoSection(product: widget.product),
            const Divider(),
            _PriceSection(product: widget.product),
            const Divider(
              thickness: Dimens.dp8,
            ),
            _StockSection(
              product: widget.product,
            )
          ],
        ),
        bottomNavigationBar: BlocBuilder<FormProductBloc, FormProductState>(
          builder: (context, state) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(Dimens.dp16),
              child: ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        if (widget.product != null) {
                          context.read<ProductBloc>().add(EditProductEvent(
                                  product: state.product(
                                id: widget.product?.id,
                                createdAt: widget.product?.createdAt,
                              )));
                        } else {
                          context.read<ProductBloc>().add(
                              CreateProductEvent(product: state.product()));
                        }
                      }
                    : null,
                child: const Text('Simpan'),
              ),
            ));
          },
        ),
      ),
    );
  }

  void confirmBtn() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const _ConfirmSection(),
    );
  }
}
