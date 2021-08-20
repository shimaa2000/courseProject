import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cartPage.dart';
import 'favourite.dart';
import 'home_page.dart';
import 'model/products.dart';
import 'network/getProducts.dart';
import 'homeScreen.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

int fav_item = 0;
int cart_item = 0;
GetProducts getProducts = GetProducts();
var favouriteOutline = Icons.favorite_border_outlined;
var favouriteFilled = Icons.favorite;
bool iconFav = false;

// FirebaseServices _firebaseServices;
class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    // Future _addToCart() {
    //   return _firebaseServices.usersRef
    //       .doc(_firebaseServices.getUserId())
    //       .collection("Cart")
    //       .doc(widget.products[itemIndex].title)
    //       .set({"size": _selectedProductSize});
    // }
    return FutureBuilder(
      future: getProducts.getProducts(),
      builder: (context, snap) {
        List<Products>? products = snap.data as List<Products>?;
        if (snap.connectionState != ConnectionState.done) {
          //print('project snapshot data is: ${snap.data}');
          return Center(
            child: Text(
              "loading",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          );
        } else {
          if (snap.hasError) {
            return Center(
              child: Text(snap.error.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.none,
                  )),
            );
          } else {
            if (snap.hasData) {
              return SingleChildScrollView(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Image.network(
                                products![itemIndex].image,
                                width: 200,
                                height: 200,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                (products[itemIndex].title),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Text(
                                ('Category: ${products[itemIndex].category}'),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Text(
                                ('Price: ${products[itemIndex].price.toString()} ERU'),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Text(
                                ('Description: ${products[itemIndex].description}'),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      onPressed: () {
                                        fav_item = itemIndex;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Favourite()),
                                        );
                                      },
                                      child: Text(
                                        'Add to Favourite',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      onPressed: () {
                                        cart_item = itemIndex;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CartPage()),
                                        );
                                      },
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
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
                        ],
                      )));

              return Text("${snap.data.toString()}");
            } else {
              return Center(
                child: Text("No DAta",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                    )),
              );
            }
          }
        }
      },
    );
  }
}
