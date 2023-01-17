import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  final int statusCode;

  const ErrorMessageModel({
    required this.message,
    required this.statusCode,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    message,
    statusCode
  ];
}
