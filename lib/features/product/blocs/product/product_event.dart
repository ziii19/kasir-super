part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductEvent {
  final String search;

  const GetProductEvent({required this.search});

  @override
  List<Object> get props => [search];
}

class CreateProductEvent extends ProductEvent {
  final ProductModel product;

  const CreateProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class EditProductEvent extends ProductEvent {
  final ProductModel product;

  const EditProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class DeleteProductEvent extends ProductEvent {
  final int id;

  const DeleteProductEvent({required this.id});

  @override
  List<Object> get props => [id];
}
