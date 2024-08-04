import 'package:bloc_listen/domain/entity/enity.dart';

abstract class Repository {
  Future<List<EntityHome>> getDataFromDataSource();
  Future<void> createPost(EntityHome post);
  Future<void> updatePost(EntityHome post);
  Future<void> deletePost(String id);
}
