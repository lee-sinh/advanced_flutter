import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/screens/post_screen.dart';
import 'repository/http_posts_repository.dart';
import 'ui/providers/post_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostProvider(repository: HttpPostRepository()),
        ),
      ],
      child: MaterialApp(
        home: PostScreen(),
      ),
    ),
  );
}
