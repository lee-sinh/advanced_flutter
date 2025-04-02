import 'package:flutter/material.dart';

import '../../model/post.dart';
import '../../repository/post_repository.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository _repository;

  AsyncValue<List<Post>>? postsValue;  // Store list of posts

  PostProvider({required PostRepository repository}) : _repository = repository;

  void fetchPost(int postId) async {
    postsValue = AsyncValue.loading();
    notifyListeners();

    try {
      Post post = await _repository.getPost(postId);
      postsValue = AsyncValue.success([post]);  // Wrap single post in a list
    } catch (error) {
      postsValue = AsyncValue.error(error);
    }

    notifyListeners();
  }

  void fetchAllPosts() async {
    postsValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Post> posts = await _repository.getAllPosts();
      postsValue = AsyncValue.success(posts);
    } catch (error) {
      postsValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}

