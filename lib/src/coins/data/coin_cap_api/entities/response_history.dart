import 'dart:convert';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/history_entity.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/response.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/coin_entity.dart';

class ResponseHistory extends Response<List<HistoryEntity>> {
  const ResponseHistory({required super.timestamp, required super.data});

  factory ResponseHistory.fromJson(Map<String, dynamic> json) {
    return ResponseHistory(
        timestamp: json['timestamp'] as dynamic,
        data: List<HistoryEntity>.from(
            json['data'].map((x) => HistoryEntity.fromJson(x))));
  }

  ResponseHistory copyWith({
    dynamic timestamp,
    HistoryEntity? data,
  }) {
    return ResponseHistory(
      timestamp: timestamp,
      data: this.data,
    );
  }

  DataMap toMap() => {
    'timestamp': timestamp,
    'data': data,
  };

  String toJson() => jsonEncode(toMap());
}