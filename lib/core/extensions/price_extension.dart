import 'package:intl/intl.dart';

extension PriceExtension on num {
  String toIDR() {
    final formarCurrentcy = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formarCurrentcy.format(this);
  }
}
