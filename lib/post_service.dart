// post_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart'; // Import the Post model

Future<List<Post>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Post.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}
