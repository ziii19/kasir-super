import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kasir_super/features/transaction/transaction.dart';

import '../../../core/core.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends Equatable {
  const TransactionModel({
    this.id = 0,
    required this.referenceId,
    required this.type,
    this.qrString = '',
    this.qrId = '',
    required this.amount,
    this.discount = 0,
    this.payAmount = 0,
    required this.createdAt,
    required this.paymentType,
    this.items = const [],
  });

  @JsonKey(includeToJson: false)
  final int id;

  @JsonKey(defaultValue: '')
  final String referenceId;

  final TypeEnum type;

  @JsonKey(defaultValue: '')
  final String qrString;

  @JsonKey(defaultValue: '')
  final String qrId;

  @JsonKey(defaultValue: 0)
  final num amount;

  @JsonKey(defaultValue: 0)
  final num discount;

  @JsonKey(defaultValue: 0)
  final num payAmount;

  final DateTime createdAt;

  @JsonKey(defaultValue: PaymentType.cash)
  final PaymentType paymentType;

  @JsonKey(defaultValue: [], includeToJson: false)
  final List<TransactionItemModel> items;

  num get total {
    return amount - discount;
  }

  num get cashback {
    return payAmount - total;
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  TransactionModel copyWith(Map<String, dynamic> json) {
    return TransactionModel(
      discount: discount,
      id: id,
      items: items + [TransactionItemModel.fromJson(json)],
      payAmount: payAmount,
      qrId: qrId,
      qrString: qrString,
      referenceId: referenceId,
      type: type,
      amount: amount,
      createdAt: createdAt,
      paymentType: paymentType,
    );
  }

  TransactionModel copyQr({String? qrIdX, String? qrStringX, TypeEnum? typeX}) {
    return TransactionModel(
      discount: discount,
      id: id,
      items: items,
      payAmount: payAmount,
      qrId: qrIdX ?? qrId,
      qrString: qrStringX ?? qrString,
      referenceId: referenceId,
      type: typeX ?? type,
      amount: amount,
      createdAt: createdAt,
      paymentType: paymentType,
    );
  }

  @override
  List<Object> get props => [
        id,
        referenceId,
        type,
        qrString,
        qrId,
        amount,
        discount,
        payAmount,
        createdAt,
        paymentType,
        items,
      ];
}
