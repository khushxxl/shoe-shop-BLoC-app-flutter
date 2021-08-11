import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_bloc_app/cart_bloc/cart_bloc.dart';
import 'package:shopping_bloc_app/models/cart_model.dart';
import 'package:shopping_bloc_app/models/product_model.dart';

class CartCard extends StatelessWidget {
  final Product product;
  const CartCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        right: 20.0,
        left: 20.0,
        bottom: 10.0,
      ),
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                product.imgUrl,
                height: 70,
                width: 70.0,
              ),
              Text('Nike Shoes'),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductRemoved(product));
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Product removed successfully',
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(Icons.delete)),
                            Text('1'),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdded(product));

                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Product added successfully',
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(Icons.add_circle))
                          ],
                        ),
                        Text('₹' + product.price.toString()),
                      ],
                    );
                  } else {
                    return Text('Something went wrong');
                  }
                },
              )
            ],
          )),
    );
  }
}
