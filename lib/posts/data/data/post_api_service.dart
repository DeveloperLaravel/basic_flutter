
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostApiService {

  final String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> getPosts()async {
  // 1. get
final  response = await http.get(Uri.parse(url));
 // 2. statusCode
if (response.statusCode == 200) {
 
  // 3. jsonDecode
  final data = jsonDecode(response.body);
  
  
    // 4. map
  final posts = data.map<PostModel>((json) {

  return PostModel.fromJson(json);
    // 5. toList
}).toList();


 // 6. return
return posts;


} else {
   throw Exception('Failed to load posts');
  // حدث خطأ
}



  }
  
}