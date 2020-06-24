import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yosadha_finance/models/user.dart';
import 'package:yosadha_finance/screens/authentication/auth.dart';
import 'package:yosadha_finance/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);
    //return home or auth widget
    if(user == null){
      return Authenticate();
    }else{
      return Homepage( user: user,);
    }
  }
}