import 'package:flutter/material.dart';
import 'details.dart';
import 'network/getProducts.dart';
import 'model/products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int itemIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  GetProducts getProducts = GetProducts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        });
  }
}
