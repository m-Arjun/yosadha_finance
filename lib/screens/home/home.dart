import 'package:flutter/material.dart';
import 'package:yosadha_finance/models/user.dart';
import 'package:yosadha_finance/services/authservice.dart';

class Home extends StatelessWidget {
 final User user;
  Home({this.user});

  final Authservice _auth =Authservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[

          FlatButton.icon(onPressed: ()async{
            await _auth.signout();
          }, icon: Icon(Icons.person), label: Text('signout'))
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Text('welcome ${user.displayname}'),
        )
        ),
    );
  }
}