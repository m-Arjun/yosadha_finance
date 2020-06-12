import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar>
    with SingleTickerProviderStateMixin<Sidebar> {
  AnimationController _animatecontrol;
  final _animationduration = const Duration(milliseconds: 500);
  StreamController<bool> issidebaropenedstreamcontroler;
  Stream<bool> isSideBaropenstream;
  StreamSink<bool> issiderbaropenedsink;
  @override
  void initState() {
    super.initState();
    _animatecontrol =
        AnimationController(vsync: this, duration: _animationduration);
    issidebaropenedstreamcontroler = PublishSubject<bool>();
    isSideBaropenstream = issidebaropenedstreamcontroler.stream;
    issiderbaropenedsink = issidebaropenedstreamcontroler.sink;
  }

  @override
  void dispose() {
    _animatecontrol.dispose();
    issidebaropenedstreamcontroler.close();
    issiderbaropenedsink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animatiostatus = _animatecontrol.status;
    final isanimationcompleted = animatiostatus == AnimationStatus.completed;
    if (isanimationcompleted) {
      issiderbaropenedsink.add(false);
      _animatecontrol.reverse();
    } else {
      issiderbaropenedsink.add(true);
      _animatecontrol.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBaropenstream,
      builder: (context,issidebaropenedasync){
        return  AnimatedPositioned(
        duration: _animationduration,
        top: 0,
        bottom: 0,
        left: issidebaropenedasync.data ? 0 : 0,
        right: issidebaropenedasync.data ? 0 : screenwidth - 45,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Color(0xFF7B1FA2),
              child: Column(
                
              ),
            )),
            Align(
              alignment: Alignment(0, -0.7),
              child: GestureDetector(
                onTap: () {
                  onIconPressed();
                },
                child: Container(
                  width: 35,
                  height: 70,
                  color: Color(0xFF7B1FA2),
                  alignment: Alignment.center,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animatecontrol.view,
                    color: Colors.blue[300],
                    size: 25,
                  ),
                ),
              ),
            )
          ],
        ),
      );
      },
          
    );
  }
}
