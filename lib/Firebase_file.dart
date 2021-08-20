import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_appfinal/home_page.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appfinal/signin.dart';
// import 'model/user.dart';
class Firebase_file{
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  //get user id
  String getUserId(){
    return _firebaseAuth.currentUser!.uid;
  }
  //initialize firebase
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  //User State
  void user_state(){
    FirebaseAuth.instance
        .idTokenChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });}
    //Sign up
    Future signup() async{
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: "barry.allen@example.com",
            password: "SuperSecretPassword!"
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    //Sign in
    Future login()async{
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: "shimaa@gmail.com",
            password: "123456"
        );
        print('Login Success');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }


}
// main(){
//   Firebase_file().login();
// }
class FireAuth {
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
  //sign in
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FireAuth.save_login();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }
  //
  void inputData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    final uid = user.uid;
    // here you write the codes to input the data into firestore
  }
  //
  static set_name(String text)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', text);
    return prefs;
  }
  //
  static set_shared(String text)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', text);
    return prefs;
  }
  //
  static save_login()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     var token = prefs.getString('token');
     name=email.split('@');
     email=token!;
    print(token);
    return token;
  }
  //Pick an Image

    // Future pickImage() async {
    //  await ImagePicker.pickImage(source: ImageSource.gallery);
    //
    //   // setState(() {
    //   //   _imageFile = File(pickedFile.path);
    //   // });
    // }
}
