part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  HomeLoadedSuccessState(this.products);
  final List<ProductDataModel> products;
}

class HomeErrorState extends HomeState {}

//actionState
class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

//actionState

class HomeProductItemWishListedActionState extends HomeActionState{}
class HomeProductItemCartedActionState extends HomeActionState{}
