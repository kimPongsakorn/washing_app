import 'package:intl/intl.dart';

class FormatConvert {
  static final FormatConvert _instance = FormatConvert._internal();
  FormatConvert._internal();
  factory FormatConvert() => _instance;

  int dateToDay({required DateTime dateTimeCourse}) {
    final formatter = DateFormat('yyyy-MM-dd');
    dateTimeCourse = formatter.parse(formatter.format(dateTimeCourse));
    DateTime now = formatter.parse(formatter.format(DateTime.now()));
    return dateTimeCourse.difference(now).inDays;
  }

  String numberComma(dynamic value) {
    return NumberFormat("#,###").format(value);
  }

  String decimal(dynamic value) {
    return NumberFormat("#,###.00")
        .format(double.parse(value.toStringAsFixed(2)));
  }
}
