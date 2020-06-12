import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yosadha_finance/models/user.dart';

bool isgooglesignin = false;

class Authservice {

  //creating an instance for the firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  //create userobject based on firebase user
  User _userfromfirebase (FirebaseUser user) {
    return user !=null ? 
    User(
      uid: user.uid,
      email: user.email,
      providerid: user.providerId,
      phn: user.phoneNumber,
      displayname: user.displayName,
      photourl: user.photoUrl
      ) : null;
  }

  //auth user change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userfromfirebase);
  }


//signin with email
Future signinwithemailandpass(email,password) async {
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    
    print(result);
    print(result.user);
    print(result.user.displayName);
    print(result.user.email);
    print(result.user.phoneNumber);
    print(result.user.photoUrl);
    print(result.user.providerId);
    print(result.user.uid);
    return [_userfromfirebase(user)]; 
  } catch (e) {
    print(e.toString());
    return [null,e.message];
  }
}

//google signin

Future signinwithgoogle()async{
try {
  GoogleSignIn googlesignin = GoogleSignIn();
  GoogleSignInAccount googleacnt = await googlesignin.signIn().catchError((err)=>print(err));
  if (googleacnt == null || ! await googlesignin.isSignedIn())
    return null;
  AuthResult result = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
    idToken: (await googleacnt.authentication).idToken, 
    accessToken:  (await googleacnt.authentication).accessToken
    ));
    // print(result);
    // print(result.user);
    // print(result.user.displayName);
    // print(result.user.email);
    // print(result.user.phoneNumber);
    // print(result.user.photoUrl);
    // print(result.user.providerId);
    // print(result.user.uid);
    
    FirebaseUser user = result.user;
    changegoogle();
    return [_userfromfirebase(user)]; 
}on PlatformException catch (e) {
      switch (e.code) {
        case 'SIGN_IN_CANCELED':
          print('Google Sign-In canceled');
          break;
              
        default:
          print('Google Sign-In error');
          break;
      }
      print(e); 
    }catch (e) {
        print(e.toString());
    return [null,e.message];
}
}

//signout
Future signout() async{
try {
  print(isgooglesignin);

    if(checkgoogle()){
      changegoogle();
      await GoogleSignIn().disconnect();
    }
    return await _auth.signOut();
  } catch (e) {
    print(e.toString());
    return null;
}
}


void changegoogle(){
  isgooglesignin=!isgooglesignin;
  print('inside chanfge $isgooglesignin');
}

bool checkgoogle(){
  print('inside the ceheckgoogle $isgooglesignin');
  if(isgooglesignin)
    return true;
  else
    return false;
}

}