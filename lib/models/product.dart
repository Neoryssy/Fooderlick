class Product {

  String dishImage;
  String title;


  int price;


  Product({

    required this.dishImage,
    required this.title,


    required this.price,

  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(

      dishImage: json['dishImage'] as String,
      title: json['title'] as String,


      price: json['price'] as int,

    );
  }
}