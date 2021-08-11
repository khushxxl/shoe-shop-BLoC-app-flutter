import 'package:equatable/equatable.dart';
import 'package:shopping_bloc_app/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});
  double get subtotal => products.fold(
        0,
        (total, current) => total + current.price,
      );
  String get subtotalString => subtotal.toString();

  @override
  List<Object?> get props => [products];
}
