import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/core/template/empty_template.dart';
import 'package:kasir_super/features/product/models/model.dart';
import 'package:kasir_super/features/product/product.dart';

part 'sections/item_section.dart';
part 'sections/floating_section.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(
      () {
        getProd();
      },
    );

    getProd();
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
      appBar: AppBar(title: const Text('Produk')),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.status == Status.deleted) {
            getProd();
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimens.dp16.height,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.dp16,
                ),
                child: SearchTextInput(
                  controller: controller,
                  hintText: 'Search by product name or SKU',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.defaultSize),
                child: SubtitleText("${state.product.length} Product"),
              ),
              Expanded(
                child: state.product.isEmpty
                    ? const EmptyTemplate()
                    : ListView.separated(
                        padding: const EdgeInsets.all(Dimens.dp16),
                        itemBuilder: (context, index) {
                          final item = state.product[index];
                          return _ItemSection(
                            product: item,
                            onDelete: () {
                              context
                                  .read<ProductBloc>()
                                  .add(DeleteProductEvent(id: item.id));
                            },
                            onEdit: () async {
                              await Navigator.pushNamed(
                                context,
                                ProductInputPage.routeName,
                                arguments: item,
                              );

                              getProd();
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Dimens.dp16.height,
                        itemCount: state.product.length,
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _FloatingSection(
        onTap: () async {
          await Navigator.pushNamed(context, ProductInputPage.routeName);

          getProd();
        },
      ),
    );
  }
}
