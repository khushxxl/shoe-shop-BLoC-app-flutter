import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String imgUrl;
  final int price;

  Product({required this.imgUrl, required this.price});

  static List<Product> products = [
    Product(
      imgUrl:
          'https://freepngimg.com/thumb/shoes/28530-3-nike-shoes-transparent.png',
      price: 14500,
    ),
    Product(
      imgUrl:
          'https://www.pikpng.com/pngl/b/301-3010824_nike-air-max-97-png-download-hiking-shoe.png',
      price: 15000,
    ),
    Product(
      imgUrl:
          'https://www.pikpng.com/pngl/b/186-1861125_free-png-download-nike-zoom-winflo-3-831561.png',
      price: 16000,
    ),
    Product(
      imgUrl:
          'https://www.pikpng.com/pngl/b/186-1861171_nike-mens-kyrie-4-basketball-shoes-png-download.png',
      price: 17000,
    ),
    Product(
      imgUrl:
          'https://www.pikpng.com/pngl/b/186-1861322_jordan-shoes-png-transparent-background-clipart.png',
      price: 18000,
    )
  ];

  @override
  List<Object?> get props => [imgUrl, price];
}
