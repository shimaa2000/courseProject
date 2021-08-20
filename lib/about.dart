import 'package:flutter/material.dart';

import 'home_page.dart';
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Stack (
      children: [
        Container(
          color: Colors.indigo,

        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                 Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(
                   Radius.circular(40.0)),

              color: Colors.white,
            ),
                   padding: EdgeInsets.all(15),
                   height: 450,
                   width: 400,
                  child: Text('''DSC Shop is a commercial store 
that aims to serve customers by providing all services and products 
and always providing them with love

This application has been developed to help you always and facilitate your purchase process,
and this application is fast and smooth to ensure a successful buying experience for our customers.
''',
                  style: TextStyle(
                    color: Colors.indigo, fontSize: 22,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),),
                ),
                SizedBox(height: 50,),
                Text(
                  'Thanks for using our app ' ,style: TextStyle(
                  color: Colors.white, fontSize: 20,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                ),
                SizedBox(height: 60,),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home_page()),
                  );},
                  child: Text('Back to home', style: TextStyle (
                    color: Colors.indigo,
                  ),),
                ),
              ],
            ),
          ),
        ),

      ],

    );
  }
}
