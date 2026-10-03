class CalculatorService {
  static double roas(double revenue, double ads) {
    return revenue / ads;
  }

  static double laba(
    double omset,
    double modal,
    double iklan,
    double operasional,
  ) {
    return omset - (modal + iklan + operasional);
  }

  static double profit(double jual, double biaya) {
    return jual - biaya;
  }
}
