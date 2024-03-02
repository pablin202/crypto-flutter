import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  const CoinEntity(
      {required this.id,
      required this.isActive,
      required this.isNew,
      required this.name,
      required this.rank,
      required this.symbol,
      required this.type});

  final String id;
  final bool isActive;
  final bool isNew;
  final String name;
  final int rank;
  final String symbol;
  final String type;

  factory CoinEntity.fromJson(Map<String, dynamic> json) => CoinEntity(
        id: json['id'] as String,
        isActive: json['is_active'] as bool,
        isNew: json['is_new'] as bool,
        name: json['name'] != null ? json['name'] as String : "",
        rank: json['rank'] as int,
        symbol: json['symbol'] != null ? json['symbol'] as String : "",
        type: json['type'] != null ? json['type'] as String : "",
      );

  CoinEntity copyWith({
    String? id,
    bool? isActive,
    bool? isNew,
    String? name,
    int? rank,
    String? symbol,
    String? type,
  }) {
    return CoinEntity(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isNew: isNew ?? this.isNew,
        name: name ?? this.name,
        rank: rank ?? this.rank,
        symbol: symbol ?? this.symbol,
        type: type ?? this.type);
  }

  @override
  List<Object?> get props => [id, name, symbol];
}
