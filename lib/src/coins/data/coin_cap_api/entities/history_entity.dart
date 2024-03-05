import 'package:equatable/equatable.dart';

class HistoryEntity extends Equatable {
  final String priceUsd;
  final int time;
  final String date;

  const HistoryEntity({
    required this.priceUsd,
    required this.time,
    required this.date,
  });

  factory HistoryEntity.fromJson(Map<String, dynamic> json) => HistoryEntity(
        priceUsd: json['priceUsd'] as String,
        time: json['time'] as int,
        date: json['date'] as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priceUsd'] = priceUsd;
    data['time'] = time;
    data['date'] = date;
    return data;
  }

  HistoryEntity copyWith({
    String? priceUsd,
    int? time,
    String? date,
  }) =>
      HistoryEntity(
        priceUsd: priceUsd ?? this.priceUsd,
        time: time ?? this.time,
        date: date ?? this.date,
      );

  @override
  List<Object> get props => [priceUsd, time, date];
}
