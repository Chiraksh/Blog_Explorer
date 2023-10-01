import 'package:flutter/material.dart';
import 'BlogDetailsScreen.dart';

class BlogPostList extends StatelessWidget {
  final List<Map<String, dynamic>> blogPosts;

  BlogPostList({required this.blogPosts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Blog Posts',style: TextStyle(
          fontFamily:'pixel',
          fontSize: 30,
          fontWeight: FontWeight.w100,
        ),),
      toolbarHeight: 60,
      elevation: 5,
      backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: blogPosts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            margin: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                // Navigate to the BlogDetailsScreen when a blog is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogDetailsScreen(
                      title: blogPosts[index]['title'],
                      imageUrl: blogPosts[index]['image_url'],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${blogPosts[index]['title']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Image.network(blogPosts[index]['image_url']),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
