import 'package:intl/intl.dart';

class FormatConvert {
  FormatConvert._internal();
  static final FormatConvert _instance = FormatConvert._internal();
  factory FormatConvert() => _instance;

  String numberComma(dynamic value) {
    return NumberFormat("#,###").format(double.parse(value));
  }

  String decimal(dynamic value) {
    return NumberFormat("#,##0.00", "th_TH").format(double.parse(value));
  }
}
