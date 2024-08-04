part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartRequestEvent extends CartEvent{}
class CartRemoveFromCartEvent extends CartEvent{
  final EntityHome productForRemove;

  CartRemoveFromCartEvent({required this.productForRemove});

}