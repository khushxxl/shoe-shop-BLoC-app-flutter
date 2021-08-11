import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_bloc_app/cart_bloc/cart_bloc.dart';
import 'package:shopping_bloc_app/models/product_model.dart';
import 'package:shopping_bloc_app/screens/product_screen.dart';
import 'package:shopping_bloc_app/widgets/top_section.dart';

class HomeScreen extends StatelessWidget {
  late final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSection(),
              Expanded(
                child: ListView.builder(
                  itemCount: Product.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: Product.products[index],
                      index: index,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  const ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
        top: 5.0,
        bottom: 10.0,
      ),
      child: Container(
        height: 170.0,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: 300.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(index: index),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: Image.network(
                    product.imgUrl,
                    height: 200.0,
                    width: 170.0,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    '₹${product.price.toString()}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                        final snackBar = SnackBar(
                          content: Text(
                            'Product added successfully',
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Container(
                        height: 40.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'ADD TO BAG',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
