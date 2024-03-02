import 'package:equatable/equatable.dart';

class Response<T> extends Equatable {
  final dynamic timestamp;
  final List<T> data;

  const Response({required this.timestamp, required this.data});

  @override
  List<Object?> get props => [data];
}
