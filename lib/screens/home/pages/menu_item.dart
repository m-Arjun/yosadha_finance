import 'package:flutter/material.dart';

class Menuitem extends StatelessWidget {

  final IconData icon;
  final String title;
  final Function onTap;

  const Menuitem({Key key, this.icon, this.title,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: <Widget>[
          Icon(icon,color: Colors.black,size: 30,),
          SizedBox(width: 20,),
          Text(title,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 26 ,color: Colors.black),)
        ],),

        
      ),
    );
  }
}