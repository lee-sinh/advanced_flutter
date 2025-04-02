import '../model/post.dart';
import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<Post> getPost(int postId) {
    return Future.delayed(Duration(seconds: 2), () {
      if (postId != 25) {
        throw Exception("No post found");
      }
      return Post(
        id: 25,
        title: 'Who is the best',
        description: 'teacher ronan',
      );
    });
  }

  @override
  Future<List<Post>> getAllPosts() {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        Post(id: 1, title: 'Post One', description: 'This is post one.'),
        Post(id: 2, title: 'Post Two', description: 'This is post two.'),
        Post(id: 3, title: 'Post Three', description: 'This is post three.'),
      ];
    });
  }
}
