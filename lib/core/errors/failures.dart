import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({required this.statusCode, required this.message})
      : assert(
          statusCode is int || statusCode is String,
          'StatusCode cannot be a ${statusCode.runtimeType}',
        );

  final dynamic statusCode;
  final String message;

  @override
  String toString() {
    return '$statusCode${statusCode is String ? '' : ' Error'}: $message';
  }

  @override
  List<Object?> get props => [statusCode, message];
}

class CacheFailure extends Failure {
  CacheFailure({required super.statusCode, required super.message});
  CacheFailure.fromException(CacheException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure({required super.statusCode, required super.message});
  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
