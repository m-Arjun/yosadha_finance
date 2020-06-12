import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yosadha_finance/models/user.dart';
import 'package:yosadha_finance/screens/wrapper.dart';
import 'package:yosadha_finance/services/authservice.dart';
import 'package:yosadha_finance/shared/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:Authservice().user,
          child: MaterialApp(
        home:Mainscreen()
      ),
    );
  }
}

class Mainscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting)
          return Loading();
        return Wrapper(); 
      },
      
    );
  }
}