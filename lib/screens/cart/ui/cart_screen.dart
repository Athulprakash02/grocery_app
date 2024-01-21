import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_cart_bloc/screens/cart/bloc/cart_bloc.dart';
import 'package:wishlist_cart_bloc/screens/cart/ui/cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CartPage')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartSuccessState) {
            return ListView.builder(
              itemCount: state.cartItems.length,
                itemBuilder: (context, index) => CartItemWidget(
                    productDataModel: state.cartItems[index],
                    cartBloc: cartBloc));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
