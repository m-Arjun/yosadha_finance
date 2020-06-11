import 'package:flutter/material.dart';
import 'package:yosadha_finance/responsive/sizeinfo.dart';

class Responsivewidget extends StatelessWidget {
  final AppBar appbar ;
  final Drawer drawer ;
  final Widget Function(BuildContext context, Sizeinfo constraints) builder;

  Responsivewidget({@required this.builder,this.appbar,this.drawer});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    Sizeinfo info = Sizeinfo(height, width, orientation);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false ,
        appBar: appbar,
        body: Builder(builder: (context){
          return builder(context,info);
        }),
        drawer: drawer,
      ),
    );
  }
}
