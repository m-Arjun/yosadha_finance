import 'package:flutter/material.dart';
import 'package:yosadha_finance/responsive/responsivewidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        SnackBar snackbar = SnackBar(backgroundColor: Colors.green,content: Text('Snack bar'),);

    return Responsivewidget(
      appbar: AppBar(
        title: Text('flutter app'),
      ),
      builder: (context,constraints){
      return Container(
          child: RaisedButton(onPressed: (){
              Scaffold.of(context).showSnackBar(snackbar);

          },
          child: Text('click me'),
          color: Colors.green,
          ),

          
      );
      }
    );
  }
}