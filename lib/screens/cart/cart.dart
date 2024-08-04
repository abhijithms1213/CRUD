import 'package:bloc_listen/screens/cart/bloc/cart_bloc.dart';
import 'package:bloc_listen/screens/cart/widgets/success_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCart extends StatelessWidget {
  ScreenCart({super.key});
  final CartBloc cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc..add(CartRequestEvent()),
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is CartDeleteActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Removed from cart')),
          );
        }
      },
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is CartErrorState) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(
                  state.msg,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        } else if (state is CartLoadedState) {
          final successState = state;
          return SuccessCartWidget(
              successState: successState, cartBloc: cartBloc);
        } else {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("No items in the cart"),
              ),
            ),
          );
        }
      },
    );
  }
}
