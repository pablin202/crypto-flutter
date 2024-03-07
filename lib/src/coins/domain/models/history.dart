import 'package:equatable/equatable.dart';

class History extends Equatable {
  const History(
      {required this.priceUsd,
        required this.time,
        required this.date});

  final double priceUsd;
  final int time;
  final String date;

  @override
  List<Object?> get props => [priceUsd, time, date];
}