part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  // final List<Map<String, dynamic>> grocecyProducts;
  final List<EntityHome> post;

  HomeLoadedState({required this.post});
}

class HomeErrorState extends HomeState {
  final String msg;

  const HomeErrorState({required this.msg});
}

class HomeLoadingState extends HomeState {}

class HomeActionState extends HomeState {}

class HomeNavToCart extends HomeActionState {}

class HomeButtonClickFromTile extends HomeActionState {}

class HomeTileCilckedActionState extends HomeActionState {}


class HomeCartedActionState extends HomeActionState {}
