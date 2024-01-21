part of 'home_bloc.dart';


@immutable

sealed class HomeState {}


abstract class HomeActionState extends HomeState {}


final class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState {}


class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}


class HomeErrorState extends HomeState {}


class HomeNavigateToWishlistPage extends HomeActionState {}


class HomeCartNavigateToCartPage extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {

  
}

class HomeProductItemCartActionState extends HomeActionState {

}