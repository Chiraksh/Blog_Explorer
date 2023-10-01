import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> fetchBlogs() async {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    print('API Response: ${response.body}');

    if (response.statusCode == 200) {
      // Parse the response as a Map<String, dynamic>
      Map<String, dynamic> responseData = jsonDecode(response.body);

      // Extract the 'blogs' field which is a list of blogs
      List<dynamic> blogs = responseData['blogs'];

      // Convert the list of blogs to a List<Map<String, dynamic>>
      List<Map<String, dynamic>> jsonDataList = List<Map<String, dynamic>>.from(blogs);

      return jsonDataList;
    } else {
      // Request failed, throw an exception
      throw Exception('Failed to fetch blogs. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any errors that occurred during the request
    print('Error: $e');
    throw Exception('Failed to fetch blogs. Error: $e');
  }
}
