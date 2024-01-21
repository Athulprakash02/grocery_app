import 'package:flutter/material.dart';
import 'package:wishlist_cart_bloc/screens/cart/bloc/cart_bloc.dart';
import 'package:wishlist_cart_bloc/screens/home/bloc/home_bloc.dart';
import 'package:wishlist_cart_bloc/screens/home/models/home_product_data_model.dart';
import 'package:wishlist_cart_bloc/screens/wishlist/bloc/wishlist_bloc.dart';

class WishlistItemWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistItemWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(productDataModel.image),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                productDataModel.name,
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                productDataModel.description,
                style: const TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${productDataModel.price}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          //     clickedProduct: productDataModel));
                        },
                        icon: const Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {
                          // homeBloc.add(HomeProductCartButtonClickedEvent(
                          //     clickedProduct: productDataModel));
                        },
                        icon: const Icon(Icons.shopping_bag_outlined),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
