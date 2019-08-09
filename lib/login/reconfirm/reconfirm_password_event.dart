import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ReconfirmPasswordEvent extends Equatable {
  ReconfirmPasswordEvent([List props = const []]) : super(props);
}
