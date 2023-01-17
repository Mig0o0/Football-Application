import 'package:dartz/dartz.dart';
import 'package:kora_test_app/core/errors/failure.dart';

abstract class Usecase<T, Parameters>{
  Future<Either<Failure, T>> call(Parameters parameters);
}