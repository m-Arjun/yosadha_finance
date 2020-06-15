import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yosadha_finance/bloc/navigation_bloc.dart';
import 'package:yosadha_finance/models/user.dart';

import 'package:yosadha_finance/screens/home/pages/sidebar.dart';

class Sidebarlayout extends StatelessWidget {
  final User user;
  Sidebarlayout({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<Navigationbloc>(
        create: (context) => Navigationbloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<Navigationbloc, NavigationStates>(
                builder: (context, navigationstate) {
              return navigationstate as Widget;
            }),
            Sidebar(user : user),
          ],
        ),
      ),
    );
  }
}
