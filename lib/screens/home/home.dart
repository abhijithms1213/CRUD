import 'package:bloc_listen/screens/cart/cart.dart';
import 'package:bloc_listen/screens/home/bloc/home_bloc.dart';
import 'package:bloc_listen/screens/home/widgets/success_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({
    super.key,
  });

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc..add(HomeRefreshEvent()),
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavToCart) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenCart(),
            ),
          );
        } else if (state is HomeTileCilckedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('tile clicked')));
        } else if (state is HomeButtonClickFromTile) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('fav from tile clicked')));
        } else if (state is HomeCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('item carted')));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is HomeErrorState) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(state.msg),
              ),
            ),
          );
        } else if (state is HomeLoadedState) {
          final successState = state;
          return SuccessStateWidget(
              homeBloc: homeBloc, successState: successState);
        } else {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("default"),
              ),
            ),
          );
        }
      },
    );
  }
}
