import 'package:flutter/material.dart';
import 'package:yosadha_finance/services/authservice.dart';
import 'package:yosadha_finance/shared/inputdec.dart';
import 'package:yosadha_finance/shared/loading.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final Authservice _auth = Authservice();
  String email = '';
  String password = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              elevation: 0,
              title: Text('signin1'),
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: inputdec.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: inputdec.copyWith(hintText: 'Password'),
                        validator: (val) => (val.isEmpty || val.length < 7)
                            ? 'Enter an password with more than 6 char'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.signinwithemailandpass(
                                email, password);
                            if (result[0] == null) {
                              //error state
                              setState(() {
                                error = result[1];
                                loading = false;
                              });
                            }
                          }
                        },
                        color: Colors.blue[200],
                        child: Text('signin'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.signinwithgoogle();

                          if (result[0] == null) {
                            //error state
                            setState(() {
                              error = result[1];
                              loading = false;
                            });
                          }
                        },
                        color: Colors.blue[200],
                        child: Text('google Signin'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                )),
          );
  }
}
