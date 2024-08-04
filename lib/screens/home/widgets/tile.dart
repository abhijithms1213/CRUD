import 'package:bloc_listen/domain/entity/enity.dart';
import 'package:bloc_listen/screens/home/bloc/home_bloc.dart';
import 'package:bloc_listen/screens/home/widgets/update.dart';
import 'package:flutter/material.dart';

class WidgetListTile extends StatelessWidget {
  const WidgetListTile({
    super.key,
    required this.homeBloc,
    required this.post,
    required this.count,
    required this.successState,
  });

  final HomeBloc homeBloc;
  final EntityHome post;
  final int count;
  final HomeLoadedState successState;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        homeBloc.add(HomeTileClickedEvent());
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: CircleAvatar(
            // backgroundImage: NetworkImage(post.image),
            backgroundColor: Colors.teal,
            child: Text(
              count.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            post.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal[900],
            ),
          ),
          subtitle: Text(post.body),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  homeBloc.add(HomeCartButtonClickedEvent(
                    clickedProduct: successState.post[count - 1],
                  ));
                },
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.orange),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UpdatePostScreen(
                      homeBloc: homeBloc,
                      post: post,
                    ),
                  ));
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  homeBloc.add(PostDeleteEvent(post.id));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
