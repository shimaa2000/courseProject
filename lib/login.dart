import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_appfinal/signin.dart';
import 'Firebase_file.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
final _mycontroller_email=TextEditingController();
final _mycontroller_password=TextEditingController();
final _formKey = GlobalKey<FormState>();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return
            Scaffold(
                body: SafeArea(child:
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Container(
                            height: 200.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/cart.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          controller: _mycontroller_email,
                          decoration: InputDecoration(
                            hintText: ('Your Email'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Email is required';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          controller: _mycontroller_password,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: ('Your Password'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Password is required';
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 25,),
                        ElevatedButton (
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.indigo)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                User? user = await FireAuth
                                    .signInUsingEmailPassword(
                                    email: _mycontroller_email.text,
                                    password: _mycontroller_password.text,
                                    context: context);
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => home_page()),
                                  );
                                  FireAuth.set_shared(_mycontroller_email.text);
                                }
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          child: Text('Log In'),
                        ),
                      ],
                    ),
                  ),
                ),));
        }
        return Text('data');
      });
  }
}
