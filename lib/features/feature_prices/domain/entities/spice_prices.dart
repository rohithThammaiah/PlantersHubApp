import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SpicePrice extends Equatable {
  final String spiceName;
  final String spicePrice;

  SpicePrice({@required this.spiceName, @required this.spicePrice});

  @override
  List<Object> get props => [spiceName, spicePrice];
}
