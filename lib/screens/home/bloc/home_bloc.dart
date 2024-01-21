import 'package:bloc/bloc.dart';


import 'package:meta/meta.dart';


import 'package:wishlist_cart_bloc/data/cart_items.dart';


import 'package:wishlist_cart_bloc/data/data.dart';


import 'package:wishlist_cart_bloc/data/wishlist_items.dart';


import 'package:wishlist_cart_bloc/screens/home/models/home_product_data_model.dart';


part 'home_event.dart';


part 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {

    on<HomeInitialEvent>((event, emit) async {

      emit(HomeLoadingState());


      await Future.delayed(Duration(seconds: 3));


      emit(HomeLoadedSuccessState(

          products: GroceryData.groceryProducts

              .map((e) => ProductDataModel(

                  id: e['id'],

                  name: e['name'],

                  description: e['description'],

                  price: e['price'],

                  image: e['image']))

              .toList()));

    });


    on<HomeWishlistNavigateEvent>((event, emit) {

      print('wishlist navigation clicked');


      emit(HomeNavigateToWishlistPage());

    });


    on<HomeCartNavigateEvent>((event, emit) {

      print('cart navigation clicked');


      emit(HomeCartNavigateToCartPage());

    });


    on<HomeProductCartButtonClickedEvent>((event, emit) {

      print('cart clicked');
      cartItems.add(event.clickedProduct);
      emit(HomeProductItemCartActionState());

    });


    on<HomeProductWishlistButtonClickedEvent>((event, emit) {
bool _isfav = false;
      print('wishlist clicked');
      // wishlistItems.add(event.clickedProduct);
      if(wishlistItems.contains(event.clickedProduct)){
        wishlistItems.remove(event.clickedProduct);

      }else{
        wishlistItems.add(event.clickedProduct);
        _isfav = true;
      }
     
      emit(HomeProductItemWishlistedActionState());

    });

  }

}

