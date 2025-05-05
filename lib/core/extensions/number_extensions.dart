import 'package:intl/intl.dart';

extension NumberExtensions on num {
  String formatCurrency() => NumberFormat.currency(
        decimalDigits: 0,
        symbol: "BDT ",
      ).format(this);
}
