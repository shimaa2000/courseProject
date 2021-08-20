import 'package:flutter/material.dart';
import 'package:flutter_appfinal/searchResult.dart';

import 'details.dart';
import 'homeScreen.dart';
import 'home_page.dart';
import 'model/products.dart';
import 'network/getProducts.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}
final myController_search=TextEditingController();

class _SearchState extends State<Search> {
  GetProducts getProducts = GetProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  controller: myController_search,
                  decoration:
                      InputDecoration(hintText: ("Enter Products' Name... ")),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                // String get_title(){
                //   if()
                // }
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResult()),
              );}, child: Text('Search')),
              SizedBox(height : 30),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => home_page()),
                    );
                  },
                  child: Text(
                    'back to home ',
                    style: TextStyle(
                        color: Colors.black, fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }

}
