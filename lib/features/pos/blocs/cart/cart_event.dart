part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class InitialCartEvent extends CartEvent {}

class IncrementCartEvent extends CartEvent {
  final ProductModel product;

  const IncrementCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class DecrementCartEvent extends CartEvent {
  final ProductModel product;

  const DecrementCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class ApplyDiscountCartEvent extends CartEvent {
  final num disc;
  final DiscountType? type;

  const ApplyDiscountCartEvent({required this.disc, required this.type});

  @override
  List<Object?> get props => [disc, type];
}
