import 'package:flutter/material.dart';
import 'package:the_boring_project/Page2.dart';

import 'bloc.dart';

class Login extends StatefulWidget {
  @override
  State createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final _bloc = Bloc();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
                stream: _bloc.email,
                builder: (context, snapshot) {
                  return TextField(
                    decoration: InputDecoration(
                        hintText: "Enter email",
                        labelText: "Email",
                        errorText: snapshot.error),
                    onChanged: _bloc.emailChanged,
                  );
                }),
            StreamBuilder<String>(
                stream: _bloc.password,
                builder: (context, snapshot) {
                  return TextField(
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                        errorText: snapshot.error),
                    onChanged: _bloc.passwordChanged,
                  );
                }),
            StreamBuilder<String>(
                stream: _bloc.confirmPassword,
                builder: (context, snapshot) {
                  return TextField(
                    decoration: InputDecoration(
                        hintText: "Re-Enter password",
                        labelText: "Confirm Password",
                        errorText: snapshot.error),
                    onChanged: _bloc.confirmChanged,
                  );
                }),
            StreamBuilder<bool>(
                stream: _bloc.submitCheck,
                builder: (context, snapshot) {
                  return RaisedButton(
                    onPressed:
                        snapshot.hasData ? () => loginConfirm(context) : null,
                    elevation: 8.0,
                    child: Text("Submit"),
                    color: Colors.teal,
                  );
                })
          ],
        ),
      ),
    );
  }

  loginConfirm(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WeatherPage()));
  }
}
