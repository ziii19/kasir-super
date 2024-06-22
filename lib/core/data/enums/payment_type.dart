enum PaymentType { qris, cash }

extension PaymentTypeExtension on PaymentType {
  String get valueName {
    switch (this) {
      case PaymentType.cash:
        return 'Tunai';
      default:
        return 'QRIS';
    }
  }
}
