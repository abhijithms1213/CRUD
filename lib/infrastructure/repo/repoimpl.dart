import 'package:bloc_listen/domain/entity/enity.dart';
import 'package:bloc_listen/domain/repo/repo.dart';
import 'package:bloc_listen/infrastructure/data/datasource.dart';
import 'package:bloc_listen/infrastructure/model/model.dart';

class RepositoryImpl implements Repository {
  DataSource dataSource = DataSourceImp();
  @override
  Future<List<EntityHome>> getDataFromDataSource() {
    final get = dataSource.getFromApi();
    return get;
  }

  @override
  Future<void> createPost(EntityHome post) async {
    await dataSource.createPost(ModelHome(
        id: post.id,
        userId: post.userId,
        title: post.title,
        body: post.body,
        image: post.image));
  }

  @override
  Future<void> updatePost(EntityHome post) async {
    await dataSource.updatePost(ModelHome(
        id: post.id,
        userId: post.userId,
        title: post.title,
        body: post.body,
        image: post.image));
  }

  @override
  Future<void> deletePost(String id) async {
    await dataSource.deletePost(id);
  }
}
