import 'dart:async';

import 'package:bloc_listen/domain/entity/cart.dart';
import 'package:bloc_listen/domain/entity/enity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartRequestEvent>(cartRequestEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartRequestEvent(
      CartRequestEvent event, Emitter<CartState> emit) {
    // emit(CartLoadingState());
    // await Future.delayed(const Duration(seconds: 2));
    emit(CartLoadedState(cartItem: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productForRemove);
    emit(CartDeleteActionState());
    emit(CartLoadedState(cartItem: cartItems));
  }
}
