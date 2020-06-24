import 'package:flutter/material.dart';
import 'package:yosadha_finance/screens/home/pages/menu_item.dart';


class Menudrawer extends StatelessWidget {
  final String displayname = "arjun"; //user.displayname ?? 'Admin';
  final String email = "arjun"; //user.email ?? 'Admin Email';
  final String
      photourl = /*user.photourl ??*/ 'https://lh5.googleusercontent.com/-S3ozT3OhoVA/AAAAAAAAAAI/AAAAAAAAAAA/Mq5Xo_1g628/s64-w40-h40-k-cc/photo.jpg';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30,bottom: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(photourl),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Text(
                    displayname,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        color: Colors.white.withAlpha(200),
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
          
                  Menuitem(
                    icon: Icons.home,
                    title: "Home",
                    onTap: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                  ),
                  Menuitem(
                    icon: Icons.publish,
                    title: "add",
                    onTap: () {
                      Navigator.of(context).pushNamed('/custadd');
                    },
                  ),
                  Menuitem(
                    icon: Icons.details,
                    title: "details",
                    onTap: () {
                      Navigator.of(context).pushNamed('/custdetails');
                    },
                  ),
                  Divider(
                    height: 64,
                    thickness: 0.5,
                    color: Colors.blue[300],
                    indent: 32,
                    endIndent: 32,
                  ),
                  Menuitem(
                    icon: Icons.exit_to_app,
                    title: "logout",
                    onTap: () async {},
                  ),
        ],
      ),
    );
  }
}
