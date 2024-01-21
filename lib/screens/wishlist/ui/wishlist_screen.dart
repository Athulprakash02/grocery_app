import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_cart_bloc/screens/cart/bloc/cart_bloc.dart';
import 'package:wishlist_cart_bloc/screens/cart/ui/cart_tile_widget.dart';
import 'package:wishlist_cart_bloc/screens/wishlist/bloc/wishlist_bloc.dart';
import 'package:wishlist_cart_bloc/screens/wishlist/ui/wishlist_product_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CartPage')),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WishlistSuccessState) {
            return ListView.builder(
              itemCount: state.wishlistItems.length,
                itemBuilder: (context, index) => WishlistItemWidget(
                    productDataModel: state.wishlistItems[index],
                    wishlistBloc: wishlistBloc));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
