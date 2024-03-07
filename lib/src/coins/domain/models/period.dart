import 'dart:math';

import 'package:equatable/equatable.dart';

int getActualUtcTime() => DateTime.now().toUtc().millisecondsSinceEpoch;

int getUtcTime(Duration duration) =>
    DateTime.now().subtract(duration).toUtc().millisecondsSinceEpoch;

Period getPeriod(Duration duration) {
  var endTime = getActualUtcTime();
  var startTime = getUtcTime(duration);
  return Period(start: startTime, end: endTime);
}

class Period extends Equatable {
  const Period({
    required this.start,
    required this.end,
  });

  final int start;
  final int end;

  factory Period.oneDay() {
    var period = getPeriod(const Duration(days: 1));
    return Period(start: period.start, end: period.end);
  }

  factory Period.oneWeek() {
    var period = getPeriod(const Duration(days: 7));
    return Period(start: period.start, end: period.end);
  }

  factory Period.oneMonth() {
    var period = getPeriod(const Duration(days: 30));
    return Period(start: period.start, end: period.end);
  }

  factory Period.threeMonth() {
    var period = getPeriod(const Duration(days: 90));
    return Period(start: period.start, end: period.end);
  }

  factory Period.sixMonth() {
    var period = getPeriod(const Duration(days: 180));
    return Period(start: period.start, end: period.end);
  }

  factory Period.oneYear() {
    var period = getPeriod(const Duration(days: 365));
    return Period(start: period.start, end: period.end);
  }

  @override
  List<Object?> get props => [start, end];
}
