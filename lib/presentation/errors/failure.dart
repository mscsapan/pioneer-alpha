import 'package:equatable/equatable.dart';

import 'errors_model.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;

  const Failure(this.message, [this.statusCode = 404]);

  @override
  List<Object> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, super.statusCode);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

class InvalidAuthData extends Failure {
  final Errors errors;

  const InvalidAuthData(this.errors) : super('');
}
