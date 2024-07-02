import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
class MoviesApiService {
  final String baseUrl = 'http://localhost:3000/api/movie';

  Future<List<Movie>> fetchItems() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
