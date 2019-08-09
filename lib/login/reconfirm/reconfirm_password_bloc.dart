import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ReconfirmPasswordBloc extends Bloc<ReconfirmPasswordEvent, ReconfirmPasswordState> {
  @override
  ReconfirmPasswordState get initialState => InitialReconfirmPasswordState();

  @override
  Stream<ReconfirmPasswordState> mapEventToState(
    ReconfirmPasswordEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
