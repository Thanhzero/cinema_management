import 'package:intl/intl.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:sprintf/sprintf.dart';

enum Pattern {
  hhmm,
  ddmmm,
  d,
  yyyyMMddTHHmmssZ,
  EEEEHHmm,
  ddMMMMHHmm,
  ddMMMMyyyyHHmm,
  ddMMyyyy,
  MMMMyyyy,
  yMMMMEEEEd,
  ddMMMMyyyy,
  hhmma,
  EEE,
  ddMM,
  EEEEddMMMMyyyy,
}

extension PatternExtension on Pattern {
  String get pattern {
    switch (this) {
      case Pattern.hhmm:
        return 'HH:mm';
      case Pattern.ddmmm:
        return 'dd MMM';
      case Pattern.d:
        return 'D';
      case Pattern.yyyyMMddTHHmmssZ:
        return 'yyyy-MM-ddTHH:mm:ssZ';
      case Pattern.EEEEHHmm:
        return 'EEEE, HH:mm';
      case Pattern.ddMMMMHHmm:
        return 'dd MMMM, HH:mm';
      case Pattern.ddMMMMyyyyHHmm:
        return 'dd MMMM yyyy, HH:mm';
      case Pattern.ddMMyyyy:
        return 'dd/MM/yyyy';
      case Pattern.MMMMyyyy:
        return 'MMMM, yyyy';
      case Pattern.yMMMMEEEEd:
        return 'yMMMMEEEEd';
      case Pattern.hhmma:
        return 'HH:mm a';
      case Pattern.EEE:
        return 'EEE';
      case Pattern.ddMM:
        return 'dd/MM';
      case Pattern.ddMMMMyyyy:
        return 'dd MMMM yyyy';
      case Pattern.EEEEddMMMMyyyy:
        return 'EEEE, dd MMMM yyyy';
      default:
        return '';
    }
  }
}

class DateTimeUtils {
  static const secondMillis = 1000;
  static const minuteMillis = 60 * secondMillis;
  static const hourMillis = 60 * minuteMillis;
  static const dayMillis = 24 * hourMillis;
  static const weekMillis = 7 * dayMillis;
  static const minuteSecond = 60;
  static const hourSecond = 60 * minuteSecond;

  static DateTime getDateTime(dynamic dateToConvert, {Pattern pattern}) {
    if (dateToConvert is int) {
      return DateTime.fromMillisecondsSinceEpoch(dateToConvert);
    } else if (dateToConvert is String) {
      if (pattern != null) {
        return DateFormat(pattern.pattern).parse(dateToConvert);
      } else {
        return null;
      }
    }
    return dateToConvert;
  }

  static int getTimestamp(dynamic dateToConvert, Pattern pattern) {
    if (dateToConvert is DateTime) {
      return dateToConvert.millisecondsSinceEpoch;
    } else if (dateToConvert is String) {
      final dateFormat = DateFormat(pattern.pattern);
      return dateFormat.parse(dateToConvert).millisecondsSinceEpoch;
    }
    return 0;
  }

  static String customGetStringDate(dynamic dateToConvert) {
    if (dateToConvert is int) {
      final datetime = getDateTime(dateToConvert);
      return 'Ngày ${datetime.day} tháng ${datetime.month} năm ${datetime.year}';
    } else if (dateToConvert is DateTime) {
      return 'Ngày ${dateToConvert.day} tháng ${dateToConvert.month} năm ${dateToConvert.year}';
    }
    return '';
  }

  static String getStringDate(dynamic dateToConvert, Pattern pattern,
      {String languageCode}) {
    if (dateToConvert == null) {
      return '';
    }
    final dateFormat = DateFormat(pattern.pattern, languageCode);
    if (dateToConvert is int) {
      final datetime = getDateTime(dateToConvert);
      return dateFormat.format(datetime);
    } else if (dateToConvert is DateTime) {
      return dateFormat.format(dateToConvert);
    }
    return '';
  }

  static String getTimeAgo(dynamic time, Pattern patternConvert,
      {String languageCode}) {
    final datetime = getTimestamp(time, patternConvert);
    final diff = DateTime.now().millisecondsSinceEpoch - datetime;
    if (diff < minuteMillis) {
      return StringConstants.justNow;
    } else if (diff < 60 * minuteMillis) {
      final minute = diff ~/ minuteMillis;
      return '$minute ${Intl.plural(minute, one: StringConstants.minuteAgo, other: StringConstants.minutesAgo)}';
    } else if (diff < 24 * hourMillis) {
      final hour = diff ~/ hourMillis;
      return '$hour ${Intl.plural(hour, one: StringConstants.hourAgo, other: StringConstants.hoursAgo)}';
    } else if (diff < 7 * dayMillis) {
      return getStringDate(datetime, Pattern.EEEEHHmm,
          languageCode: languageCode);
    } else if (diff < 30 * dayMillis) {
      return getStringDate(datetime, Pattern.ddMMMMHHmm,
          languageCode: languageCode);
    }
    return getStringDate(datetime, Pattern.ddMMMMyyyyHHmm,
        languageCode: languageCode);
  }

  static String getTimeFeature(dynamic timestamp, {String languageCode}) {
    if (timestamp == null) {
      return '';
    }
    final datetime = getDateTime(timestamp);
    if (datetime == null) {
      return '';
    }
    if (isToday(datetime)) {
      return sprintf(StringConstants.formatDateTimeToday,
          [getStringDate(datetime, Pattern.hhmm, languageCode: languageCode)]);
    }
    final date = DateTimeUtils.getStringDate(datetime, Pattern.ddMMyyyy);
    final time = DateTimeUtils.getStringDate(datetime, Pattern.hhmm);
    return sprintf(StringConstants.formatDateTime, [date, time]);
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
            .difference(DateTime(now.year, now.month, now.day))
            .inDays ==
        0;
  }

  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  static bool isExpired(DateTime date) {
    final now = DateTime.now();
    return date.millisecondsSinceEpoch < now.millisecondsSinceEpoch;
  }

  static bool isEqual(DateTime from, DateTime to) {
    if (from == null || to == null) {
      return true;
    }
    return DateTime(from.year, from.month, from.day)
            .difference(DateTime(to.year, to.month, to.day))
            .inDays ==
        0;
  }

  static bool isPastDate(dynamic dateToCheck) {
    if (dateToCheck is int) {
      return DateTime.now().millisecondsSinceEpoch > dateToCheck;
    }
    return false;
  }
}
