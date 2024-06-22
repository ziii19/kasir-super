enum TypeEnum { draft, paid, unpaid }

extension TypeEnumExtension on TypeEnum {
  String get valueName {
    switch (this) {
      case TypeEnum.draft:
        return 'Draft';
      case TypeEnum.paid:
        return 'Paid';
      case TypeEnum.unpaid:
        return 'Unpaid';
      default:
        return 'All';
    }
  }
}
