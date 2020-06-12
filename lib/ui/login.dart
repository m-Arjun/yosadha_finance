// import 'package:flutter/material.dart';
// import 'package:yosadha_finance/responsive/responsivewidget.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Responsivewidget(
//       appbar: AppBar(
//         title: Text('Login'),
//         centerTitle: true,
//       ),
//       builder: (context,constraints){
//       return Container(
//           child: RaisedButton(onPressed: ()async {
//             // try {
//             //   GoogleSignIn googlesignin =GoogleSignIn();
//             //   GoogleSignInAccount googleacnt = await googlesignin.signIn();
//             //   if(googleacnt ==null)
//             //     return null;
//             //   Authresult res = _auth.signinwithcreditial(GoogleAuthProvider.getcredtinoal(
//             //     idtoken: (await googelacnt.authentication).idtoke,
//             //     accesstoken: (await googelacnt.authentication).accesstoken,
//             //     ));
//             //     if (res.user == false )
//             //       return null;
//             // } catch (e) {
//             // }

//           },
//           child: Text('Google signin'),
//           color: Colors.green,
//           )
//           ); 
//       }
//     );
//   }
// }