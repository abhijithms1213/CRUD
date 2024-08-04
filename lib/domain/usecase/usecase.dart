import 'package:bloc_listen/domain/entity/enity.dart';
import 'package:bloc_listen/domain/repo/repo.dart';
import 'package:bloc_listen/infrastructure/repo/repoimpl.dart';

class UseCase {
  Repository repository = RepositoryImpl();
  Future<List<EntityHome>> getDataFromRepo() {
    final posts = repository.getDataFromDataSource();
    return posts;
  }

  
  Future<void> createPost(EntityHome post) async {
    await repository.createPost(post);
  }

  Future<void> updatePost(EntityHome post) async {
    await repository.updatePost(post);
  }

  Future<void> deletePost(String id) async {
    await repository.deletePost(id);
  }
}
