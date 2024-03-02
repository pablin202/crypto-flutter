// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  final String? explorer;

  const CoinEntity({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
  });

  factory CoinEntity.fromJson(Map<String, dynamic> json) => CoinEntity(
      id: json['id'] as String,
      rank: json['rank'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      supply: json['supply'] as String,
      maxSupply: json['maxSupply'] != null ? json['maxSupply'] as String : null,
      marketCapUsd:
          json['marketCapUsd'] != null ? json['marketCapUsd'] as String : null,
      volumeUsd24Hr: json['volumeUsd24Hr'] != null
          ? json['volumeUsd24Hr'] as String
          : null,
      priceUsd: json['priceUsd'] != null ? json['priceUsd'] as String : null,
      changePercent24Hr: json['changePercent24Hr'] != null
          ? json['changePercent24Hr'] as String
          : null,
      vwap24Hr: json['vwap24Hr'] != null ? json['vwap24Hr'] as String : null,
      explorer: json['explorer'] != null ? json['explorer'] as String : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['symbol'] = symbol;
    data['name'] = name;
    data['supply'] = supply;
    data['maxSupply'] = maxSupply;
    data['marketCapUsd'] = marketCapUsd;
    data['volumeUsd24Hr'] = volumeUsd24Hr;
    data['priceUsd'] = priceUsd;
    data['changePercent24Hr'] = changePercent24Hr;
    data['vwap24Hr'] = vwap24Hr;
    data['explorer'] = explorer;
    return data;
  }

  CoinEntity copyWith({
    String? id,
    String? rank,
    String? symbol,
    String? name,
    String? supply,
    String? maxSupply,
    String? marketCapUsd,
    String? volumeUsd24Hr,
    String? priceUsd,
    String? changePercent24Hr,
    String? vwap24Hr,
    String? explorer,
  }) =>
      CoinEntity(
        id: id ?? this.id,
        rank: rank ?? this.rank,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        supply: supply ?? this.supply,
        maxSupply: maxSupply ?? this.maxSupply,
        marketCapUsd: marketCapUsd ?? this.marketCapUsd,
        volumeUsd24Hr: volumeUsd24Hr ?? this.volumeUsd24Hr,
        priceUsd: priceUsd ?? this.priceUsd,
        changePercent24Hr: changePercent24Hr ?? this.changePercent24Hr,
        vwap24Hr: vwap24Hr ?? this.vwap24Hr,
        explorer: explorer ?? this.explorer,
      );

  @override
  List<Object> get props => [
        id,
        rank,
        symbol,
        name,
        supply,
      ];
}
