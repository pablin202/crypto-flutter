import 'dart:convert';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/rate_entity.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/response.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/coin_entity.dart';

class ResponseRates extends Response<List<RateEntity>> {
  const ResponseRates({required super.timestamp, required super.data});

  factory ResponseRates.fromJson(Map<String, dynamic> json) {
    return ResponseRates(
        timestamp: json['timestamp'] as dynamic,
        data: List<RateEntity>.from(
            json['data'].map((x) => RateEntity.fromJson(x))));
  }

  ResponseRates copyWith({
    dynamic timestamp,
    List<RateEntity>? data,
  }) {
    return ResponseRates(
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
