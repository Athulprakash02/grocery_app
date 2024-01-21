import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_cart_bloc/data/wishlist_items.dart';
import 'package:wishlist_cart_bloc/screens/cart/ui/cart_screen.dart';
import 'package:wishlist_cart_bloc/screens/home/ui/product_tile_widget.dart';
import 'package:wishlist_cart_bloc/screens/wishlist/ui/wishlist_screen.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());

    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeCartNavigateToCartPage) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistPage) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const WishlistScreen()));
        } else if (state is HomeProductItemCartActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item added to Cart')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: const Text('Item wishlisted')));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HomeLoadedSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Grocery App'),
              // centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishlistNavigateEvent());
                  },
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartNavigateEvent());
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                )
              ],
            ),
            body: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    homeBloc: homeBloc,
                    productDataModel: state.products[index],
                  );
                }),
          );
        } else if (state is HomeErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Errorr'),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}



// Scaffold(
//           appBar: AppBar(
//             title: const Text('Grocery App'),
//             // centerTitle: true,
//             actions: [
//               IconButton(
//                 onPressed: () {
//                   homeBloc.add(HomeWishlistNavigateEvent());
//                 },
//                 icon: Icon(Icons.favorite_border),
//               ),
//               IconButton(
//                 onPressed: () {
//                   homeBloc.add(HomeCartNavigateEvent());
//                 },
//                 icon: Icon(Icons.shopping_bag_outlined),
//               )
//             ],
//           ),
//         );