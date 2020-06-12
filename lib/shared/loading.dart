import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Container(
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         SpinKitChasingDots(
          color: Colors.blue,
          size: 50  ,
        ),
        SizedBox(height: 20,),
        Text('Loading')
        ]
      ),
      
    )
          ),
      ),
      
    );
  }
}