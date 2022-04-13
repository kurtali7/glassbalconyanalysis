enum UserType{
  GENEL,
  BKS,
  HEPSI
}

extension CurrencyIntDefinitonExtension on UserType {
  int get intDefinition {
    switch (this) {
      case UserType.GENEL:
        return 0;
      case UserType.BKS:
        return 1;
      case UserType.HEPSI:
        return 2;
      default:
        return 0;
    }
  }
}