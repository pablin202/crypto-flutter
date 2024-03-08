import 'package:equatable/equatable.dart';

class RateEntity extends Equatable {
  const RateEntity(
      {required this.id,
      required this.symbol,
      required this.currencySymbol,
      required this.type,
      required this.rateUsd});

  final String id;
  final String symbol;
  final String currencySymbol;
  final String type;
  final String rateUsd;

  factory RateEntity.fromJson(Map<String, dynamic> json) => RateEntity(
        id: json['id'] as String,
        symbol: json['symbol'] as String,
        currencySymbol: json['currencySymbol'] as String,
        type: json['type'] as String,
        rateUsd: json['rateUsd'] as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['currencySymbol'] = currencySymbol;
    data['type'] = type;
    data['rateUsd'] = rateUsd;
    return data;
  }

  RateEntity copyWith({
    String? id,
    String? symbol,
    String? currencySymbol,
    String? type,
    String? rateUsd,
  }) =>
      RateEntity(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        type: type ?? this.type,
        rateUsd: rateUsd ?? this.rateUsd,
      );

  @override
  List<Object?> get props => [id, symbol, currencySymbol, type, rateUsd];
}
