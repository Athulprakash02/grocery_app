import 'package:bloc/bloc.dart';


import 'package:meta/meta.dart';


import 'package:wishlist_cart_bloc/data/cart_items.dart';


import 'package:wishlist_cart_bloc/screens/home/models/home_product_data_model.dart';


part 'cart_event.dart';


part 'cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc() : super(CartInitial()) {

    on<CartInitialEvent>((event, emit) {

      emit(CartSuccessState(cartItems: cartItems));

    });

    on<CartRemoveFromCartEvent>((event, emit) {
      cartItems.remove(event.productDataModel);
      emit(CartSuccessState(cartItems: cartItems));

    });

  }

}

