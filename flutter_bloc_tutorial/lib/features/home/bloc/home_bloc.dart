import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/data/cart_items.dart';
import 'package:flutter_bloc_tutorial/data/grocery_data.dart';
import 'package:flutter_bloc_tutorial/data/wishlist_items.dart';
import 'package:flutter_bloc_tutorial/features/home/models/home_product_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(
      homeInitialEvent,
    );

    on<HomeProductWishlistButtonClickEvent>(
      homeProductWishlistButtonClickEvent,
    );
    on<HomeProductCartButtonClickEvent>(
      homeProductCartButtonClickEvent,
    );
    on<HomeWishlistButtonNavigateEvent>(
      homeWishlistButtonNavigateEvent,
    );
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
    HomeProductWishlistButtonClickEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Wishlist Product clicked');
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
    HomeProductCartButtonClickEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Cart Product clicked ');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Wished appbar clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Cart appbar clicked ');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    //use try catch block
    emit(HomeLoadingState());
    await Future.delayed(
      const Duration(seconds: 3),
    );
    emit(
      HomeLoadedSuccessState(
        GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }
}
