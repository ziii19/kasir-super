import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/product/models/product_model.dart';
import 'package:kasir_super/features/product/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial()) {
    on<GetProductEvent>((event, emit) async {
      try {
        emit(state.copywith(status: Status.loading));

        final service = await ProductService.getAll(event.search);

        emit(state.copywith(status: Status.success, product: service));
      } catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });
    on<CreateProductEvent>((event, emit) async {
      try {
        emit(state.copywith(status: Status.loading));

        await ProductService.create(event.product);

        emit(state.copywith(status: Status.apply));
      } catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });
    on<EditProductEvent>((event, emit) async {
      try {
        emit(state.copywith(status: Status.loading));

        await ProductService.update(event.product);

        emit(state.copywith(status: Status.apply));
      } catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });
    on<DeleteProductEvent>((event, emit) async {
      try {
        emit(state.copywith(status: Status.loading));

        await ProductService.delete(event.id);

        emit(state.copywith(status: Status.deleted));
      } catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
