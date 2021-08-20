import 'package:flutter/material.dart';
import 'package:flutter_appfinal/Search.dart';

import 'details.dart';
import 'homeScreen.dart';
import 'home_page.dart';
import 'model/products.dart';
import 'network/getProducts.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

int index_search = 0;

class _SearchResultState extends State<SearchResult> {
  GetProducts getProducts = GetProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getProducts.getProducts(),
          builder: (context, snap) {
            List<Products>? products = snap.data as List<Products>?;

            if (snap.connectionState != ConnectionState.done) {
              //print('project snapshot data is: ${snap.data}');
              return Text(
                "loading",
                style: TextStyle(
                  fontSize: 16,
                  //color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              );
            } else {
              if (snap.hasError) {
                return Text(
                  '${snap.error.toString()} ',
                  style: TextStyle(
                    fontSize: 16,
                    //color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                );
              } else {
                if (snap.hasData) {
                  return ListView.builder(
                      itemCount: products!.length,
                      itemBuilder: (context, index) {
                        if (products[index].title.toString().contains(
                                myController_search.text.toLowerCase()) ||
                            products[index].title.toString().contains(
                                myController_search.text.toUpperCase())) {
                          return Column(
                            children: [
                              IconButton(
                                icon: Image.network(
                                  products[index].image,
                                  //width: 100,
                                  //  height: 100,
                                ),
                                iconSize: 100,
                                onPressed: () {
                                  itemIndex = index;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details()),
                                  );
                                },
                              ),
                              Text(
                                products[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  //color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          );
                        }
                        return Text('');
                      });
                } else {
                  return Text(
                    "No DAta",
                    style: TextStyle(
                      fontSize: 16,
                      //color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  );
                }
              }
            }

            return Text('dghdg');
          }),
    );
  }
}
