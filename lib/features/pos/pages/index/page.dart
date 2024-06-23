import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/core/template/empty_template.dart';
import 'package:kasir_super/features/pos/pos.dart';
import 'package:kasir_super/features/product/models/model.dart';

import '../../../product/product.dart';

part 'sections/item_section.dart';
part 'sections/cart_section.dart';

class POSPage extends StatefulWidget {
  const POSPage({super.key});

  @override
  State<POSPage> createState() => _POSPageState();
}

class _POSPageState extends State<POSPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(
      () {
        getProd();
      },
    );

    getProd();

    context.read<CartBloc>().add(InitialCartEvent());
    super.initState();
  }

  void getProd() {
    context.read<ProductBloc>().add(GetProductEvent(search: controller.text));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('POS')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: SearchTextInput(
                controller: controller,
                hintText: 'Search by product name or SKU'),
          ),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.status == Status.success && state.product.isEmpty) {
                  return const EmptyTemplate();
                }
                return ListView.separated(
                    padding: const EdgeInsets.all(Dimens.dp16),
                    itemBuilder: (context, index) {
                      final item = state.product[index];
                      return _ItemSection(
                        product: item,
                      );
                    },
                    separatorBuilder: (context, index) => Dimens.dp16.height,
                    itemCount: state.product.length);
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.carts.isEmpty) {
            return const SizedBox();
          } else {
            return _CartSection(
              qty: state.getQty,
              price: state.getEstimate,
            );
          }
        },
      ),
    );
  }
}
