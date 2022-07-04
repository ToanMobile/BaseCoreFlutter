import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../share/constant/constant.dart';

String? formatDate(DateTime? date, [String format = DATE_TIME_FORMAT2]) {
  if (date == null) return null;
  var formatter = DateFormat(format);
  return formatter.format(date);
}

int getUnixTimestamp(String? dateTime, [String format = DATE_TIME_FORMAT2]) {
  if (dateTime == null) return 0;
  var formatter = DateFormat(format).parse(dateTime);
  return formatter.millisecondsSinceEpoch ~/ 1000;
}

int getUnixDateTime(DateTime? dateTime, [String format = DATE_FORMAT]) {
  if (dateTime == null) return 0;
  return dateTime.millisecondsSinceEpoch ~/ 1000;
}

DateTime? parseDate(String? strDate, String format, {bool utc = true}) {
  if (strDate == null) return null;
  try {
    return DateFormat(format).parse(strDate, utc).toLocal();
  } catch (e) {
    return null;
  }
}

int getAgeFromTimeString(String? dateTime, [String format = DATE_FORMAT]) {
  if (dateTime == null) return 0;
  var formatter = DateFormat(format).parse(dateTime);
  return DateTime.now().year - formatter.year;
}

bool isToday(DateTime day) {
  return isSameDay(day, DateTime.now());
}

bool isSameDay(DateTime dayA, DateTime dayB) {
  return dayA.year == dayB.year && dayA.month == dayB.month && dayA.day == dayB.day;
}

bool isSameMonth(DateTime dayA, DateTime dayB) {
  return dayA.year == dayB.year && dayA.month == dayB.month;
}

bool isWeekend(DateTime date) {
  return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
}

bool isInRange(DateTime date, DateTime start, DateTime end) {
  return date.compareTo(startOfDay(start)) >= 0 && date.compareTo(endOfDay(end)) <= 0;
}

DateTime startOfDay(DateTime date, {bool utc = false}) {
  if (utc) {
    return DateTime.utc(date.year, date.month, date.day);
  }
  return DateTime(date.year, date.month, date.day);
}

DateTime endOfDay(DateTime date, {bool utc = false}) {
  if (utc) {
    return DateTime.utc(date.year, date.month, date.day, 23, 59, 59, 999);
  }
  return DateTime(date.year, date.month, date.day);
}

String formatTimeOfDuration(int seconds) {
  String result = "";

  if (seconds > 0) {
    if (seconds < 60) {
      result = "00:${formatDecimalTime(seconds)}";
    } else {
      int minutes = seconds ~/ 60;
      result = "${formatDecimalTime(seconds % 60)}";
      if (minutes < 60) {
        result = "${formatDecimalTime(minutes)}:" + result;
      } else {
        int hours = minutes ~/ 60;
        result = "${formatDecimalTime(hours)}:${formatDecimalTime(minutes % 60)}:" + result;
      }
    }
  } else {
    result = "00:00";
  }
  return result;
}

String formatDecimalTime(int number) {
  return number <= 9 ? "0$number" : "$number";
}

String readTimeStampByHour(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 && diff.inDays == 0) {
    time = format.format(date);
  } else if (diff.inHours > 0 && diff.inHours < 24) {
    time = diff.inHours.toString() + " giờ";
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    time = diff.inDays.toString() + ' ngày';
  } else {
    time = (diff.inDays / 7).floor().toString() + ' tuần';
  }

  return time;
}

String readTimeStampByHourDay(int timestamp) {
  if (timestamp == null) return "";
  var format = DateFormat('HH:mm dd/MM/yyyy');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return format.format(date);
}

String readTimeStampByDayHour(int? timestamp) {
  if (timestamp == null) return "";
  var format = DateFormat('HH:MM - dd/MM/yyyy');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return format.format(date);
}

String readTimeStampFull(int? timestamp, String? languageCode) {
  if (timestamp == null) return "";
  var format = DateFormat('EEEE, dd/MM/yyyy - HH:mm', languageCode);
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return format.format(date);
}

// timestamp in seconds
String getDayBySecond(int? timestampInSeconds) {
  if (timestampInSeconds == null) return "";
  var format = DateFormat('dd/MM/yyyy');
  var date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
  return format.format(date);
}

DateTime getDateBySecond(int? timestampInSeconds) {
  if (timestampInSeconds == null) return DateTime.now();
  var date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
  return date;
}

String getTimeByUnixTimestamp(int? timestampInSeconds) {
  if (timestampInSeconds == null) return "";
  var format = DateFormat('HH:mm');
  var date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
  return format.format(date);
}

String getDMYByTimeStamp(int? timestamp) {
  if (timestamp == null) return "";
  var format = DateFormat('dd/MM/yyyy');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return format.format(date);
}

String getMonthYearByTimeStamp(int? timestampInSeconds) {
  if (timestampInSeconds == null) return "";
  var date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
  return "${date.month}/${date.year}";
}

String getDayByTimeStamp(int? timestampInSeconds) {
  if (timestampInSeconds == null) return "";
  var date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
  return "${date.day}";
}

String formatPrice(double n) {
  final formatter = NumberFormat("#,###.#");
  return formatter.format(n);
}

String getDateCustom(DateTime date) {
  return "${date.day} tháng ${date.month}";
}

bool compareDateTimeWithTimestamp(int timeOne, int timeTwo) {
  final dateOne = DateTime.fromMillisecondsSinceEpoch(timeOne * 1000);
  final dateTwo = DateTime.fromMillisecondsSinceEpoch(timeTwo * 1000);
  if (dateOne.day != dateTwo.day) return true;
  return false;
}

String formatGetMonth(int value) {
  switch (value) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "Apr";
    case 5:
      return "May";
    case 6:
      return "Jun";
    case 7:
      return "Jul";
    case 8:
      return "Aug";
    case 9:
      return "Sep";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    case 12:
      return "Dec";
    default:
      return "Jan";
  }
}

int getAgeFromDateTime(DateTime birthDay) {
  return DateTime.now().year - birthDay.year;
}

String readTimeStampBySecond(int? timestamp) {
  if (timestamp == null) return "";
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 0) {
    time = 'justNow'.tr;
  } else if (diff.inSeconds > 0 && diff.inSeconds < 60) {
    time = 'justNow'.tr;
  } else if (diff.inMinutes > 0 && diff.inMinutes < 60) {
    time = diff.inMinutes.toString() + " " + 'minute'.tr.toLowerCase();
  } else if (diff.inHours > 0 && diff.inHours < 24) {
    time = diff.inHours.toString() + " " + 'hour'.tr.toLowerCase();
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    time = diff.inDays.toString() + ' ' + 'day'.tr.toLowerCase();
  } else {
    time = (diff.inDays / 7).floor().toString() + ' ' + 'week'.tr.toLowerCase();
  }

  return time;
}

DateTime convertTimeOfDayToDate(DateTime? date, TimeOfDay time) {
  if (date == null) {
    final date = DateTime.now();
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  } else {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
