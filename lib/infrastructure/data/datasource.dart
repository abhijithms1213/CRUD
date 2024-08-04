import 'dart:convert';
import 'dart:developer';
import 'package:bloc_listen/domain/api_key.dart';
import 'package:bloc_listen/infrastructure/model/model.dart';
import 'package:http/http.dart' as http;

abstract class DataSource {
  Future<List<ModelHome>> getFromApi();
  Future<void> createPost(ModelHome post);
  Future<void> updatePost(ModelHome post);
  Future<void> deletePost(String id);
}

class DataSourceImp implements DataSource {
  final String apiUrl=apiKey;


  @override
  Future<List<ModelHome>> getFromApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<ModelHome> models =
            jsonList.map((jsonItem) => ModelHome.fromJson(jsonItem)).toList();
        return models;
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      log('Error fetching data from API: $e');
      return [];
    }
  }
  
  @override
  Future<void> createPost(ModelHome post) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create post');
    }
  }

  @override
  Future<void> updatePost(ModelHome post) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${post.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update post');
    }
  }

  @override
  Future<void> deletePost(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }
}
