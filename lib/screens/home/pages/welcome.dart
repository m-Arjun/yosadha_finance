import 'package:flutter/material.dart';
import 'package:yosadha_finance/bloc/navigation_bloc.dart';

class Welcome extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome page',style:TextStyle(fontSize: 30)),
    );
  }
}