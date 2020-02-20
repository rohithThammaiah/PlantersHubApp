import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class GenericAPIResponse extends Equatable {
  final String status;
  final Object data;

  GenericAPIResponse({@required this.status, this.data});
}