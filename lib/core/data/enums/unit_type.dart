enum UnitType { pcs, unit, kg, gram, liter }

extension UnitExtenType on UnitType {
  String get valueName {
    switch (this) {
      case UnitType.gram:
        return 'Gram';
      case UnitType.pcs:
        return 'Pcs';
      case UnitType.unit:
        return 'Unit';
      case UnitType.kg:
        return 'Liter';
      default:
        return 'Kg';
    }
  }
}
