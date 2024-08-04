import 'package:bloc_listen/domain/entity/enity.dart';
import 'package:bloc_listen/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class UpdatePostScreen extends StatelessWidget {
  final HomeBloc homeBloc;
  final EntityHome post;

  UpdatePostScreen({super.key, required this.homeBloc, required this.post});

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final imagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = post.title;
    bodyController.text = post.body;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Post'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            TextField(
              controller: imagecontroller,
              decoration: InputDecoration(
                labelText: 'image url',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                final updatedPost = EntityHome(
                    id: post.id,
                    userId: post.userId,
                    title: titleController.text,
                    body: bodyController.text,
                    image: imagecontroller.text);

                homeBloc.add(PostUpdateEvent(updatedPost));
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
