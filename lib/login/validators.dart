import 'package:flutter/material.dart';
import 'dart:async';
import 'bloc.dart';


mixin Validators{

  // From handlers gives whatever data is coming to the stream
  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains("@")){
        // If Email is valid add it to the sink.(Stream Output)
        sink.add(email);
      }else{
        // If Email is not valid add error to the sink.(Stream Output)
        sink.addError("Email not valid");
      }
    }
  );


  var passwordValidtor = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length>4){
        sink.add(password);
      }else{
        sink.addError("Password Not valid");
      }
    }
  );

   StreamTransformer<String, String> confirmPasswordValidator(Stream<String> password){

     return StreamTransformer<String,String>.fromHandlers(
        handleData: (data,sink){
          print("Checking life +" + password.toString());
          if(data==""){
            sink.add("Passwords Match");
          }else{
            sink.addError("Passwords Do not Match");
          }
        }
    );

  }
}