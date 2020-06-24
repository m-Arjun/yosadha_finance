import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yosadha_finance/bloc/navigation_bloc.dart';
import 'package:yosadha_finance/models/user.dart';
import 'package:yosadha_finance/screens/home/pages/menu_item.dart';
import 'package:yosadha_finance/services/authservice.dart';


class Sidebar extends StatefulWidget {
  final User user;
  Sidebar({this.user});
  @override
  _SidebarState createState() => _SidebarState(user:user);
}

class _SidebarState extends State<Sidebar>
    with SingleTickerProviderStateMixin<Sidebar> {
_SidebarState({this.user});
      User user;
      final Authservice _auth =Authservice();
      

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
    final String displayname = user.displayname ?? 'Admin';
    final String email = user.email ?? 'Admin Email';
    final String photourl = user.photourl ?? 'https://lh5.googleusercontent.com/-S3ozT3OhoVA/AAAAAAAAAAI/AAAAAAAAAAA/Mq5Xo_1g628/s64-w40-h40-k-cc/photo.jpg';
    
    
    
    final screenwidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBaropenstream,
      builder: (context,issidebaropenedasync){
        return  AnimatedPositioned(
        duration: _animationduration,
        top: 0,
        bottom: 0,
        left: issidebaropenedasync.data ? 0 : -screenwidth,
        right: issidebaropenedasync.data ? 0 : screenwidth - 45,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
              color: Color(0xFF7B1FA2),
              child: Column(
                
                  children: <Widget>[
                    SizedBox(height: 100,),
                    ListTile(
                      title: Text(displayname,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w800),),
                      subtitle: Text(email,style: TextStyle(color: Colors.white.withAlpha(200),fontSize: 15,fontWeight: FontWeight.w800),),
                      leading: CircleAvatar(backgroundImage: NetworkImage(photourl) ,radius:30,)
                    ),
                    Divider(height: 64,thickness: 0.5,color: Colors.blue[300],indent: 32,endIndent: 32,),
                    Menuitem(
                      icon: Icons.home,
                      title: "Home",
                      onTap: (){
                        onIconPressed();
                        BlocProvider.of<Navigationbloc>(context).add(NavigationEvent.Welcomepageclick);
                      },
                    ),
                    Menuitem(
                      icon: Icons.publish,
                      title: "add",
                      onTap: (){
                        onIconPressed();
                        BlocProvider.of<Navigationbloc>(context).add(NavigationEvent.Customeraddclick);
                      },
                    ),
                    Menuitem(
                      icon: Icons.details,
                      title: "details",
                      onTap: (){
                        onIconPressed();
                        BlocProvider.of<Navigationbloc>(context).add(NavigationEvent.Customerdetailsclick);
                      },
                    ),
                     Divider(height: 64,thickness: 0.5,color: Colors.blue[300],indent: 32,endIndent: 32,),
                    
                    Menuitem(
                      icon: Icons.exit_to_app,
                      title: "logout",
                      onTap: ()async{
                        
                      await _auth.signout();
                        onIconPressed();
                        //BlocProvider.of<Navigationbloc>(context).add(NavigationEvent.Customerdetailsclick);
                      },
                    ),
                  
                  ],
              ),
            )),
            Align(
              alignment: Alignment(0, -0.7),
              child: GestureDetector(
                onTap: () {
                  onIconPressed();
                },
                child: ClipPath(
                  clipper: CustomMenuclipper(),
                                  child: Container(
                    
                    width: 35,
                    height: 110,
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
              ),
            )
          ],
        ),
      );
      },
          
    );
  }


}

class CustomMenuclipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color =Colors.white;
    final width  =size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2-20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
    path.quadraticBezierTo(0, height-8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}