import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../product/models/model.dart';

part 'transaction_item_model.g.dart';

@JsonSerializable()
class TransactionItemModel extends Equatable {
  const TransactionItemModel({
    this.id = 0,
    this.qty = 1,
    this.note = '',
    required this.title,
    required this.desc,
    required this.image,
    required this.regularPrice,
    required this.price,
    required this.stock,
    required this.unit,
    required this.sku,
    required this.transactionId,
  });

  @JsonKey(includeToJson: false)
  final int id;

  @JsonKey(defaultValue: 1)
  final int qty;

  @JsonKey(defaultValue: '')
  final String note;

  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(defaultValue: '')
  final String desc;

  @JsonKey(defaultValue: '')
  final String image;

  @JsonKey(defaultValue: 0)
  final int regularPrice;

  @JsonKey(defaultValue: 0)
  final int price;

  @JsonKey(defaultValue: 0)
  final int stock;

  @JsonKey(defaultValue: '')
  final String unit;

  @JsonKey(defaultValue: '')
  final String sku;

  final int transactionId;

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemModelToJson(this);

  TransactionItemModel changeId(int id) {
    return TransactionItemModel(
      title: title,
      desc: desc,
      image: image,
      regularPrice: regularPrice,
      price: price,
      stock: stock,
      unit: unit,
      sku: sku,
      transactionId: id,
    );
  }

  ProductModel get toCart {
    return ProductModel(
      name: title,
      desc: desc,
      image: image,
      regularPrice: regularPrice,
      price: price,
      stock: stock,
      unit: unit,
      sku: sku,
      id: id,
      createdAt: DateTime.now(),
    );
  }

  @override
  List<Object> get props => [
        id,
        qty,
        note,
        title,
        desc,
        image,
        regularPrice,
        price,
        stock,
        unit,
        sku,
        transactionId,
      ];
}
