import 'package:bloc_listen/domain/entity/enity.dart';
import 'package:bloc_listen/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatelessWidget {
  final HomeBloc homeBloc;

  CreatePostScreen({super.key, required this.homeBloc});

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final imagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
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
            TextField(
              controller: imagecontroller,
              decoration: InputDecoration(
                labelText: 'image url',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                final create = EntityHome(
                  id: "120",
                  userId: 20,
                  title: titleController.text,
                  body: bodyController.text,
                  image: imagecontroller.text,
                );

                homeBloc.add(PostCreateEvent(create));
                Navigator.of(context).pop();
              },
              child: const Text(
                'Create',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
