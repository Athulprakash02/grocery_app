import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:wishlist_cart_bloc/data/wishlist_items.dart';

import 'package:wishlist_cart_bloc/screens/home/models/home_product_data_model.dart';


part 'wishlist_event.dart';

part 'wishlist_state.dart';


class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {

  WishlistBloc() : super(WishlistInitial()) {

    on<WishlistInitialEvent>((event, emit) {
      emit(WishlistSuccessState(wishlistItems: wishlistItems));
    });

  }

}

