part of 'form_product_bloc.dart';

class FormProductState extends Equatable {
  const FormProductState({
    this.error,
    this.name,
    this.description,
    this.image,
    this.priceRegular,
    this.unit,
    this.priceItem,
    this.status = Status.initial,
    this.stock,
    this.sku,
  });

  factory FormProductState.initial() {
    return const FormProductState();
  }

  ProductModel product({int? id, DateTime? createdAt}) {
    return ProductModel(
      id: id ?? 0,
      name: name ?? '',
      desc: description ?? '',
      image: image ?? '',
      regularPrice: priceRegular ?? 0,
      price: priceItem ?? 0,
      stock: stock ?? 0,
      unit: unit ?? '',
      sku: sku ?? '',
      createdAt: createdAt ?? DateTime.now(),
    );
  }

  final Status status;
  final String? error;
  final String? name;
  final String? description;
  final String? image;
  final int? priceRegular;
  final String? unit;
  final int? priceItem;
  final int? stock;
  final String? sku;

  num get margin {
    return ((priceRegular ?? 0) - (priceItem ?? 0)) / (priceRegular ?? 0) * 100;
  }

  num get profit {
    return (priceRegular ?? 0) - (priceItem ?? 0);
  }

  bool get isValid =>
      name != null &&
      name!.isNotEmpty &&
      description != null &&
      description!.isNotEmpty &&
      priceRegular != null &&
      (priceRegular ?? 0) > 0 &&
      unit != null &&
      unit!.isNotEmpty;

  FormProductState copyWith({
    Status? status,
    String? error,
    String? name,
    String? description,
    String? image,
    int? priceRegular,
    String? unit,
    int? priceItem,
    int? stock,
    String? sku,
  }) {
    return FormProductState(
      status: status ?? this.status,
      error: error,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      priceRegular: priceRegular ?? this.priceRegular,
      unit: unit ?? this.unit,
      priceItem: priceItem ?? this.priceItem,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        name,
        description,
        image,
        priceRegular,
        unit,
        priceItem,
        stock,
        sku,
      ];
}

final class FormProductInitial extends FormProductState {}
