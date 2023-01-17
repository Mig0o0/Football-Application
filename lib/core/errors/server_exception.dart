import 'package:kora_test_app/core/network/network_exception.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}