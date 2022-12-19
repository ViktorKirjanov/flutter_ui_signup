import 'package:equatable/equatable.dart';
import 'package:flutter_ui_signup/core/errors/network_exception.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  NetworkFailure(this.exception);

  final NetworkException exception;

  @override
  List<Object?> get props => [exception];

  @override
  bool? get stringify => true;
}
