import 'package:flutter/material.dart';
import 'package:yosadha_finance/models/user.dart';
import 'package:yosadha_finance/screens/home/pages/menu_drawer.dart';


import 'package:yosadha_finance/services/authservice.dart';
//import 'package:yosadha_finance/services/authservice.dart';

class Homepage extends StatelessWidget {
 final User user;
  Homepage({this.user});
  
  final Authservice _auth =Authservice();
  @override
  Widget build(BuildContext context) {
     //final String displayname = user.displayname ?? 'Admin';
    return //Sidebarlayout(user: user);
     Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton.icon(onPressed: ()async{
            await _auth.signout();
          }, icon: Icon(Icons.person), label: Text('signout'))
        ],
      ),
      drawer: Menudrawer(),
      body: SafeArea(
        child: Container(
          child: Text('welcome 123 '),
        )
        ),
    );
  }
}