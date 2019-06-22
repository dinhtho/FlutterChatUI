import 'package:intl/intl.dart';
import 'dart:ui';

class AppUtil {
  static final String ME = 'James Dam';

  static String convertDateTime(String s) {
    final formatter = DateFormat('EEE,MMM dd');
    return formatter.format(DateTime.parse(s).toLocal()).toUpperCase();
  }

  static String convertDateTime2HH(String s) {
    final formatter = DateFormat('hh:mm a');
    return formatter.format(DateTime.parse(s).toLocal()).toUpperCase();
  }
}
