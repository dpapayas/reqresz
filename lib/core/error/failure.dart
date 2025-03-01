import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

// ⚡ Server Failure (API error)
class ServerFailure extends Failure {
  const ServerFailure({required String message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}

// ⚡ Cache Failure (Local Storage error)
class CacheFailure extends Failure {
  const CacheFailure({required String message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}

// ⚡ Network Failure (Internet Connection error)
class NetworkFailure extends Failure {
  const NetworkFailure({required String message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}

// ⚡ Exception Failure (General unexpected error)
class ExceptionFailure extends Failure {
  const ExceptionFailure({required String message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}

// ⚡ Credential Failure (Invalid user input)
class CredentialFailure extends Failure {
  const CredentialFailure({required String message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}

// ⚡ Authentication Failure (Login/Auth error)
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({required String message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}
