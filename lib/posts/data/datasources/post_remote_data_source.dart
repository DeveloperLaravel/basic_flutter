import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostRemoteDataSource {
  Future<List<PostModel>> getPosts() async {
    final url = 'https://jsonplaceholder.typicode.com/posts';
   final response = await http.get(
  Uri.parse(url),
);
if(response.statusCode == 200){
final data = jsonDecode(response.body);
final  posts = data.map<PostModel>((json) {
  return PostModel.fromJson(json);
}).toList();
  return posts;
}
throw Exception('Failed to load posts');
}
}