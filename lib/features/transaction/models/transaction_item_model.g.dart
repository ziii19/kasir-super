// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionItemModel _$TransactionItemModelFromJson(
        Map<String, dynamic> json) =>
    TransactionItemModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      qty: (json['qty'] as num?)?.toInt() ?? 1,
      note: json['note'] as String? ?? '',
      title: json['title'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      image: json['image'] as String? ?? '',
      regularPrice: (json['regularPrice'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      unit: json['unit'] as String? ?? '',
      sku: json['sku'] as String? ?? '',
      transactionId: (json['transactionId'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionItemModelToJson(
        TransactionItemModel instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'note': instance.note,
      'title': instance.title,
      'desc': instance.desc,
      'image': instance.image,
      'regularPrice': instance.regularPrice,
      'price': instance.price,
      'stock': instance.stock,
      'unit': instance.unit,
      'sku': instance.sku,
      'transactionId': instance.transactionId,
    };
