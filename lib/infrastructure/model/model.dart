
import 'package:bloc_listen/domain/entity/enity.dart';

class ModelHome extends EntityHome {
  const ModelHome(
      {required super.id,
      required super.title,
      required super.body,
      required super.userId,
      required super.image,
      
      });
  factory ModelHome.fromJson(Map<String, dynamic> json) {
    return ModelHome(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        userId: json['userId'],
        image: json['image']);
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'image':image,
    };
  }
}
