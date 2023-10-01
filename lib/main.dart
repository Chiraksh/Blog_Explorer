import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'api_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SubSpace', style: TextStyle(
            fontFamily:'pixel',
            fontSize: 53,
            fontWeight: FontWeight.w400,
            shadows: [
              Shadow(
                color: Colors.blueAccent,
                blurRadius: 3.0,
                offset: Offset(4.0, 4.0),
              )
            ],
          ),),
          toolbarHeight: 100,
          elevation: 5,
          backgroundColor: Colors.blueGrey,
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchBlogs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error.toString()}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No blogs available.'));
            } else {
              return BlogPostList(blogPosts: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
