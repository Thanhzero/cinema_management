import 'package:intl/intl.dart';

class FormatUtils {
  static String formatCurrency(double currency) {
    return NumberFormat.simpleCurrency(locale: 'vi').format(currency);
  }
  static String formatDistance(double distance){
    if (distance != null){
      if (distance < 1000){
        return '${NumberFormat("####", "vi").format(distance)} m';
      }else if (distance >= 1000){
        double kmDistance = distance/1000;
        return '${NumberFormat("###.0#", "vi").format(kmDistance)} km';
      }
    }

    return '';
  }
}