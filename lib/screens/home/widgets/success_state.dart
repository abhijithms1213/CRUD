import 'package:bloc_listen/screens/home/bloc/home_bloc.dart';
import 'package:bloc_listen/screens/home/widgets/create.dart';
import 'package:bloc_listen/screens/home/widgets/tile.dart';
import 'package:flutter/material.dart';

class SuccessStateWidget extends StatelessWidget {
  const SuccessStateWidget({
    super.key,
    required this.homeBloc,
    required this.successState,
  });

  final HomeBloc homeBloc;
  final HomeLoadedState successState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CRUD(Api) With BLOC & CLEAN architecture",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.teal[800]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {
                homeBloc.add(HomeNavToCartEvent());
              },
              child: const Icon(
                Icons.shopping_cart,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            final post = successState.post[index];
            final count = index + 1;
            return WidgetListTile(
                homeBloc: homeBloc,
                post: post,
                count: count,
                successState: successState);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: successState.post.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreatePostScreen(homeBloc: homeBloc),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
