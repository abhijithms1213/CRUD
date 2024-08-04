part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoadedState extends CartState {
  final List<EntityHome> cartItem;

  CartLoadedState({required this.cartItem});
}

class CartErrorState extends CartState {
  final String msg;

  CartErrorState({required this.msg});
}

class CartLoadingState extends CartState {}

class CartActionState extends CartState {}

class CartDeleteActionState extends CartActionState {


}
