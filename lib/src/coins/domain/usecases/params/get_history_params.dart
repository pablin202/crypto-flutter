import 'package:equatable/equatable.dart';

class GetHistoryParams extends Equatable {
  final String id;

  const GetHistoryParams({required this.id});

  @override
  List<Object?> get props => [id];
}