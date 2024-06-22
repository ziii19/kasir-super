part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.error,
    this.product = const [],
    this.status = Status.initial,
  });

  factory ProductState.initial() {
    return const ProductState();
  }

  final String? error;
  final Status status;
  final List<ProductModel> product;

  ProductState copywith({
    String? error,
    Status? status,
    List<ProductModel>? product,
  }) {
    return ProductState(
      error: error,
      status: status ?? this.status,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [error, status, product];
}
