import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/pos/pos.dart';
import 'package:kasir_super/features/product/models/model.dart';

import '../../../transaction/transaction.dart';
import '../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<InitialCartEvent>((event, emit) {
      emit(CartState.initial());
    });

    on<IncrementCartEvent>((event, emit) {
      var items = List<CartModel>.from(state.carts);

      if (state.findItem(event.product.id) == null) {
        items.add(CartModel(product: event.product));
      } else {
        items = [];

        for (var element in state.carts) {
          if (event.product.id == element.product.id) {
            items
                .add(CartModel(product: element.product, qty: element.qty + 1));
          } else {
            items.add(element);
          }
        }
      }

      emit(state.copyWith(carts: items));
    });
    on<DecrementCartEvent>((event, emit) {
      List<CartModel> items = [];

      for (var element in state.carts) {
        if (event.product.id == element.product.id) {
          if (element.qty > 1) {
            items
                .add(CartModel(product: element.product, qty: element.qty - 1));
          }
        } else {
          items.add(element);
        }
      }

      emit(state.copyWith(carts: items));
    });

    on<ApplyDiscountCartEvent>((event, emit) {
      emit(state.copyWith(disc: event.disc, type: event.type));
    });
  }
}
