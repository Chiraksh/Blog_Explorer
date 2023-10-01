import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatefulWidget {
  final String title;
  final String imageUrl;

  BlogDetailsScreen({required this.title, required this.imageUrl});

  @override
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Blog Details',style: TextStyle(
        fontFamily:'pixel',
            fontSize: 30,
            //fontWeight: FontWeight.w100,
        ),),
      toolbarHeight: 60,
      elevation: 5,
      backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
             decoration: BoxDecoration(
               border: Border(bottom: BorderSide(color: Colors.black, width: 5))
             ),
             padding: EdgeInsets.only(bottom: 10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child:
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                ),),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
            ),),
            SizedBox(height: 16),
            Image.network(widget.imageUrl, fit: BoxFit.cover,
            width:400,
              height:250 ,
            ),
            SizedBox(height: 16),
            Text('Blog content goes here...'), // Add blog content or details here
          ],
        ),
      ),
    );
  }

}
