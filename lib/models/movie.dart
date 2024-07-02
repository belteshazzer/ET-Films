import 'gener.dart';

class Movie {
  final String title;
  final Genre genre;
  final String videoUrl;
  final String coverImageUrl;
  final String description;
  final bool myList;
  final String releaseDate;

  Movie({
    required this.releaseDate,
    required this.title,
    required this.genre,
    required this.videoUrl,
    required this.coverImageUrl,
    required this.description,
    required this.myList,
  });

  // A factory method to create a Movie from a JSON object
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'Unknown title',
      genre: genreFromString(json['genre']),
      videoUrl: json['video_url'] ?? '',
      coverImageUrl: json['cover_image_url'] ?? '',
      description: json['description'],
      myList: json['mylist'] ?? false,
      releaseDate: json['release_date'] ?? 'Unknown date',
    );
  }

  // A method to convert a Movie object into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'genre': genre.toString().split('.').last, 
      'video_url': videoUrl,
      'cover_image_url': coverImageUrl,
      'description': description,
      'mylist': myList,
      'release_date': releaseDate,
    };
  }
}

