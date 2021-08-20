import 'dart:convert';
import 'package:flutter_appfinal/model/products.dart';
import 'package:http/http.dart' as http;

class GetProducts{
  Future <List<Products>> getProducts () async{
    final String url = 'https://fakestoreapi.com/products';
    final http.Response response= await http.get(Uri.parse(url));
    if ( response.statusCode == 200){
      final json = jsonDecode(response.body);
      List<Products> products =[];
      for( var item in json){
        products.add(Products.fromJson(item));
      }
     return products;

    }else{
      throw Exception('error loading');
    }
  }
  //Add To Cart
  Future addToCart () async{
    List<Products> products =[];
    final String url = 'https://fakestoreapi.com/carts';
    final http.Response response= await http.post(Uri.parse(url),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body: jsonEncode(<String, dynamic>{
          'userId':'5',
          'date':'2020-02-03',
          'products':[{'productId':'5','quantity':1},{'productId':'1','quantity':5}],
        }));
    if ( response.statusCode == 200){
      final json = jsonDecode(response.body);

      //print(json);
      return json;
    }else{
      throw Exception('error loading');
    }
    return products;
  }
//   body:JSON.stringify(
//       {
//         userId:5,
//         date:2020-02-03,
//         products:[{productId:5,quantity:1},{productId:1,quantity:5}]
//       }
//       )
// }
  // Future<Album> createAlbum(String title) async {
  //   final http.Response response = await http.post(
  //     'https://jsonplaceholder.typicode.com/albums',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'title': title,
  //     }),
  //   );
}