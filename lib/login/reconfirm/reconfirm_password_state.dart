import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ReconfirmPasswordState extends Equatable {
  ReconfirmPasswordState([List props = const []]) : super(props);
}

class InitialReconfirmPasswordState extends ReconfirmPasswordState {}
