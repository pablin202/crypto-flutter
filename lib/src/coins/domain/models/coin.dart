import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  const Coin(
      {required this.id,
      required this.name,
      required this.rank,
      required this.symbol,
      required this.imageUrl,
      required this.usdPrice,
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
  final double changePercent24Hr;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? vwap24Hr;
  final String? explorer;

  @override
  List<Object?> get props => [id, name, symbol];
}
