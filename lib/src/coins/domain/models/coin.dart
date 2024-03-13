import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  const Coin(
      {required this.id,
      required this.name,
      required this.rank,
      required this.symbol,
      required this.imageUrl,
      required this.usdPrice,
      required this.convertedPrice,
      required this.changePercent24Hr,
      required this.supply,
      required this.maxSupply,
      required this.marketCapUsd,
      required this.volumeUsd24Hr,
      required this.vwap24Hr,
      required this.explorer});

  final String id;
  final String name;
  final int rank;
  final String symbol;
  final String imageUrl;
  final double usdPrice;
  final double convertedPrice;
  final double changePercent24Hr;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? vwap24Hr;
  final String? explorer;

  Coin copyWith(
          {String? id,
          int? rank,
          String? symbol,
          String? name,
          String? supply,
          String? maxSupply,
          String? marketCapUsd,
          String? volumeUsd24Hr,
          double? usdPrice,
          double? convertedPrice,
          double? changePercent24Hr,
          String? vwap24Hr,
          String? explorer,
          String? imageUrl}) =>
      Coin(
          id: id ?? this.id,
          rank: rank ?? this.rank,
          symbol: symbol ?? this.symbol,
          name: name ?? this.name,
          supply: supply ?? this.supply,
          maxSupply: maxSupply ?? this.maxSupply,
          marketCapUsd: marketCapUsd ?? this.marketCapUsd,
          volumeUsd24Hr: volumeUsd24Hr ?? this.volumeUsd24Hr,
          usdPrice: usdPrice ?? this.usdPrice,
          convertedPrice: convertedPrice ?? this.convertedPrice,
          changePercent24Hr: changePercent24Hr ?? this.changePercent24Hr,
          vwap24Hr: vwap24Hr ?? this.vwap24Hr,
          explorer: explorer ?? this.explorer,
          imageUrl: imageUrl ?? this.imageUrl);

  @override
  List<Object?> get props => [id, name, symbol];
}
