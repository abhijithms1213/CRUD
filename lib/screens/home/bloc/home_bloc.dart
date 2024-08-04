import 'dart:async';
import 'dart:developer';

import 'package:bloc_listen/domain/entity/cart.dart';
import 'package:bloc_listen/domain/entity/enity.dart';
import 'package:bloc_listen/domain/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeRefreshEvent>(homeRefreshEvent);
    on<HomeNavToCartEvent>(homeNavToCartEvent);
    on<HomeCartButtonClickedEvent>(homeCartButtonClickedEvent);
    on<HomeTileClickedEvent>(homeTileClickedEvent);
    on<PostCreateEvent>(postCreateEvent);

    on<PostUpdateEvent>(postUpdateEvent);
    on<PostDeleteEvent>(postDeleteEvent);
  }

  FutureOr<void> homeRefreshEvent(
      HomeRefreshEvent event, Emitter<HomeState> emit) async {
    try {
      log("refresh clicked");
      emit(HomeLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      final post = await UseCase().getDataFromRepo();
      emit(HomeLoadedState(post: post));
    } catch (e) {
      emit(HomeErrorState(msg: e.toString()));
    }
  }

  FutureOr<void> homeNavToCartEvent(
      HomeNavToCartEvent event, Emitter<HomeState> emit) {
    log("nav to cart clicked ");
    emit(HomeNavToCart());
  }

  FutureOr<void> homeCartButtonClickedEvent(
      HomeCartButtonClickedEvent event, Emitter<HomeState> emit) {
    log("fav clicked from tile");
    emit(HomeButtonClickFromTile());
    cartItems.add(event.clickedProduct);
    emit(HomeCartedActionState());
  }

  FutureOr<void> homeTileClickedEvent(
      HomeTileClickedEvent event, Emitter<HomeState> emit) {
    log("clicked tile");
    emit(HomeTileCilckedActionState());
  }

  FutureOr<void> postCreateEvent(
      PostCreateEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await UseCase().createPost(event.post);
    add(HomeRefreshEvent());
  }

  FutureOr<void> postUpdateEvent(
      PostUpdateEvent event, Emitter<HomeState> emit) async {
    await UseCase().updatePost(event.post);
    log("taped postUpdateEvent ");
    add(HomeRefreshEvent());
  }

  FutureOr<void> postDeleteEvent(
      PostDeleteEvent event, Emitter<HomeState> emit) async {
    log("taped postDeleteEvent ");
    await UseCase().deletePost(event.id);
    add(HomeRefreshEvent());
  }
}
