import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';
import 'homeScreen.dart';
import 'home_page.dart';
import 'model/products.dart';
class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProducts.getProducts(),
      builder: (context, snap) {
        List<Products>? products = snap.data as List<Products>?;
        if (snap.connectionState != ConnectionState.done) {
          //print('project snapshot data is: ${snap.data}');
          return  Text("loading" ,style: TextStyle(
            fontSize: 16,
            //color: Colors.black,
            decoration: TextDecoration.none,

          ),);
        } else {
          if (snap.hasError) {
            return Text('${snap.error.toString()} ',style: TextStyle(
              fontSize: 16,
              //color: Colors.black,
              decoration: TextDecoration.none,

            ),);
          }
          else {
            if (snap.hasData) {


              return Container(
                color: Colors.white,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                      child: Row (
                              children: [
                                 Image.network(
                                    products![fav_item].image,
                                    width: 100,
                                      height: 100,

                                  ),
                                SizedBox(width: 20,),

                                Column(
                                  children: [
                                    Text(
                                      products[fav_item].title,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,

                                      ),),

                                    Row(
                                      children:[
                                        Text(
                                          products[fav_item].category,
                                          style: TextStyle(
                                            fontSize: 11,
                                            //color: Colors.black,
                                            decoration: TextDecoration.none,

                                          ),),
                                        SizedBox(width: 20,),

                                        Text(
                                            '${products[fav_item].price.toString()} ERU',
                                          style: TextStyle(
                                            fontSize: 11,
                                            //color: Colors.black,
                                            decoration: TextDecoration.none,

                                          ),),
                                      ]
                                    ),

                                    TextButton(onPressed: (){Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => home_page()),
                                    );}, child: Text('back to home ' ,style:
                                    TextStyle( color: Colors.black, fontSize: 16),))

                                  ],
                                ),

                              ],
                            ),
                    ),
                  ),
                ),
              );



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
