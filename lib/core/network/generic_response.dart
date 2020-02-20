import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class GenericAPIResponse extends Equatable {
  final String status;
  final Object data;
  final String message;

  GenericAPIResponse({
    @required this.status,
    this.data,
    this.message
  }) : super([status, data, message]);
}