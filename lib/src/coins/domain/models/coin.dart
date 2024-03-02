import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  const Coin(
      {required this.id,
      required this.name,
      required this.rank,
      required this.symbol,
      required this.imageUrl,
      required this.usdPrice,
      required this.changePercent24Hr});

  final String id;
  final String name;
  final int rank;
  final String symbol;
  final String imageUrl;
  final String usdPrice;
  final String changePercent24Hr;

  @override
  List<Object?> get props => [id, name, symbol];
}
