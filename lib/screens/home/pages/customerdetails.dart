import 'package:flutter/material.dart';
import 'package:yosadha_finance/bloc/navigation_bloc.dart';
import 'package:yosadha_finance/screens/home/pages/menu_drawer.dart';

class Custdetails extends StatelessWidget  with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Csutomer details'),
      ),
      drawer: Menudrawer(),
      body: SafeArea(
        child: Container(
          child: Text('CUSTOMER DETAILS '),
        )
        ),
    );
  }
}