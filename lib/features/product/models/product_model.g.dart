// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      image: json['image'] as String? ?? '',
      regularPrice: (json['regularPrice'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      unit: json['unit'] as String? ?? '',
      sku: json['sku'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'image': instance.image,
      'regularPrice': instance.regularPrice,
      'price': instance.price,
      'stock': instance.stock,
      'unit': instance.unit,
      'sku': instance.sku,
      'createdAt': instance.createdAt.toIso8601String(),
    };
