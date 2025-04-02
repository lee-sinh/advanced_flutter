import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post.dart';
import 'post_repository.dart';

class HttpPostRepository extends PostRepository {
  @override
  Future<Post> getPost(int postId) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Post.fromJson(jsonData);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Post>> getAllPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
