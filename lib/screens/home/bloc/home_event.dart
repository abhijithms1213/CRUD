part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class HomeRefreshEvent extends HomeEvent {}

class HomeNavToCartEvent extends HomeEvent {}

class HomeCartButtonClickedEvent extends HomeEvent {
  final EntityHome clickedProduct;

  HomeCartButtonClickedEvent({required this.clickedProduct});
}

class HomeTileClickedEvent extends HomeEvent {}

class PostCreateEvent extends HomeEvent {
  final EntityHome post;

  const PostCreateEvent(this.post);
}

class PostUpdateEvent extends HomeEvent {
  final EntityHome post;

  const PostUpdateEvent(this.post);
}

class PostDeleteEvent extends HomeEvent {
  final String id;

  const PostDeleteEvent(this.id);
}
