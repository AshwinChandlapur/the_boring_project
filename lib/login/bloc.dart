import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';

class Bloc extends Object with Validators implements baseBloc{

  //Stream Controller
  final emailController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();
  final reconfirmController = BehaviorSubject<String>();


  // This is how data reaches the Stream, we are telling whatevr we get, put it in _emailController sink
  Function(String) get emailChanged=>emailController.sink.add;
  Function(String) get passwordChanged =>passwordController.sink.add;
  Function(String) get confirmChanged=>reconfirmController.sink.add;

  //Stream is controller by Stream Controller

  // When there is a value inside the stream we can do operations on it, such as email validations,
  // this is done via stream transform. Stream transformer takes in some data and does some operations
  // and pushes results to the sink
  Stream<String> get email => emailController.stream.transform(emailValidator);
  Stream<String> get password => passwordController.stream.transform(passwordValidtor);
  Stream<String> get confirmPassword => reconfirmController.stream.transform(confirmPasswordValidator(password));

  // From RxDart, Stream is called Observable,
  // StreamController is called Subject
  Stream<bool> get submitCheck => Observable.combineLatest3(email, password, confirmPassword,(email,password,confirmPassword)=>true);


  // One should properly dispose Stream Controllers
  @override
  void dispose() {
      emailController?.close();
      passwordController?.close();
      reconfirmController?.close();
  }


}

abstract class baseBloc{
  void dispose();
}