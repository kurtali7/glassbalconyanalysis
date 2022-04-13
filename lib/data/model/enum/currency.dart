enum Currency{
  TL,
  DOLLAR,
  EURO
}

extension CurrencyIntDefinitonExtension on Currency {
  int get intDefinition {
    switch (this) {
      case Currency.TL:
        return 0;
      case Currency.DOLLAR:
        return 1;
      case Currency.EURO:
        return 2;
      default:
        return 0;
    }
  }
}