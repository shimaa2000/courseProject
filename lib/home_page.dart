import 'package:flutter/material.dart';
import 'package:flutter_appfinal/Firebase_file.dart';
import 'package:flutter_appfinal/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appfinal/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Search.dart';
import 'about.dart';
import 'cartPage.dart';
import 'favourite.dart';
import 'homeScreen.dart';
import 'introScreen.dart';

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

bool isDark = false;

String email='';
List<String> name= email.split('@');

class _home_pageState extends State<home_page> {
  int currentIndex = 0;
  var value1 = false;
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
  );
  ThemeData _Dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
  );
  List<Widget> screens = [
    HomeScreen(),
    Favourite(),
    CartPage(),
  ];
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: _Dark,
      theme: _light,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      //color: Colors.indigo,

                      ),
                  child: Column(
                    children: [
                      CircleAvatar(radius: 30,
                        backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),),
                      SizedBox(
                        height: 12,
                      ),
                      Text(name[0]),
                      SizedBox(
                        height: 12,
                      ),
                      Text(email),
                    ],
                  )),
              SwitchListTile(
                value: isDark,
                onChanged: (bool value) {
                  setState(() {
                    isDark = !isDark;
                  });
                },
                title: Text('Dark Mode'),
              ),
              ListTile(
                title: Text('Language'),
              ),
              ListTile(
                title: Text('Sign Out'),
                onTap: () async {
                  FireAuth.set_shared('');
                  FireAuth.set_name('');
                  await FirebaseAuth.instance.signOut();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => IntroScreen(),
                    ),
                  );
                },
                // Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => IntroScreen()),
                // );
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('DCS Shop'),
          centerTitle: true,
          actions:[
            IconButton(onPressed: (){
              {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );}
            }, icon:  Icon(Icons.search)),
          ],
          //backgroundColor: Colors.indigo,
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index1) {
            setState(() {
              currentIndex = index1;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
          ],
        ),
      ),
    );
  }
}
