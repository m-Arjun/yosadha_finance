import 'package:flutter/material.dart';

import 'package:yosadha_finance/screens/home/pages/sidebar.dart';

class Sidebarlayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
        children: <Widget>[
          
          Sidebar(),
        ],
        
      ),
    );
  }
}