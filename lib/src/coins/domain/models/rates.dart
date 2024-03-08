import 'package:equatable/equatable.dart';

class Rate extends Equatable {
  const Rate(
      {required this.id,
      required this.symbol,
      required this.currencySymbol,
      required this.type,
      required this.rateUsd});

  final String id;
  final String symbol;
  final String currencySymbol;
  final String type;
  final double rateUsd;

  @override
  List<Object?> get props => [id, symbol, currencySymbol, type, rateUsd];
}
