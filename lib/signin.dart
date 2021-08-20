import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Firebase_file.dart';
import 'home_page.dart';
class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

final myController_name = TextEditingController();
final myController_email = TextEditingController();
final myController_password = TextEditingController();
FirebaseAuth auth = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();
class _SigninState extends State<Signin> {
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
          return Scaffold(
              body: SafeArea(
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {

                              },
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
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              controller: myController_name,
                              decoration: InputDecoration(
                                hintText: ('Your Name ...'),
                              ),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Name is required';
                                else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              controller: myController_email,
                              decoration: InputDecoration(
                                hintText: ('Your Email ...'),
                              ),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Email is required';
                                else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              controller: myController_password,
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
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: ('Confirm Your Password'),
                              ),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Password is required';
                                else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.indigo)),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    User? user = await FireAuth
                                        .registerUsingEmailPassword(
                                        name: myController_name.text,
                                        email: myController_email.text,
                                        password: myController_password.text);
                                    if (user != null) {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => home_page()),
                                      );
                                      FireAuth.set_name(myController_name.text);
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                }
                              },
                              child: Text('Sign Up'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        }
        return Text(('jhjhjh'));
      }
    );
  }
}
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => home_page()),
// );
