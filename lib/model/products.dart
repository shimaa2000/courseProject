
class Products {
  late final dynamic id;
  late final String title;
  late final dynamic price;
  late final String category;
  late final String description;
  late final String image;


  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  Products.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.price = json['price'];
    this.category = json['category'];
    this.description = json['description'];
    this.image = json['image'];

  }

  Map<String, dynamic> toJson() {
    late final Map<String, dynamic> product = new Map<String, dynamic>();
    product['id'] = this.id;
    product['title'] = this.title;
    product['price'] = this.price;
    product['category'] = this.category;
    product['description'] = this.description;
    product['image'] = this.image;

    return product;
  }
}
