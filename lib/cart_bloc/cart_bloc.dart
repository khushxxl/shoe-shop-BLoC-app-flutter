import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shopping_bloc_app/models/cart_model.dart';
import 'package:shopping_bloc_app/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is CartProductAdded) {
      yield* _mapCartProductedAddedToState(event, state);
    } else if (event is CartProductRemoved) {
      yield* _mapCartProductRemovedToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield CartLoaded();
    } catch (e) {}
  }

  Stream<CartState> _mapCartProductedAddedToState(
    CartProductAdded event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      yield CartLoaded(
        cart: Cart(
          products: List.from(state.cart.products)..add(event.product),
        ),
      );
    }
  }

  Stream<CartState> _mapCartProductRemovedToState(
    CartProductRemoved event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      yield CartLoaded(
        cart: Cart(
          products: List.from(state.cart.products)..remove(event.product),
        ),
      );
    }
  }
}
