import 'dart:async';

import 'package:ethio_films/controllers/movies_service.dart';
import 'package:ethio_films/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'youtube_player.dart';

class NewReleases extends StatefulWidget {
  const NewReleases({Key? key}) : super(key: key);

  @override
  State<NewReleases> createState() => _NewReleasesState();
}

class _NewReleasesState extends State<NewReleases> {
  List<Movie> _videos = [];
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentIndex = 0;
  late Future<List<Movie>> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie= _fetchVideos();
    _startAutoScroll();
  }

  Future<List<Movie>> _fetchVideos() async {
    try {
      print("Fetching videos...");
      final videos = await MoviesApiService().fetchItems();
      setState(() {
        _videos = videos;
      });
      print("Videos fetched and set in state: $_videos");
      return videos;
    } catch (e) {
      print('Error fetching videos: $e');
      return [];
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentIndex < _videos.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      print("Auto-scrolled to page $_currentIndex");
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:FutureBuilder<List<Movie>>(
              future: futureMovie,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No items found'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      final videoId = YoutubePlayer.convertUrlToId(item.videoUrl);
                      return NewReleasePlayer(
                        imageUrl: item.coverImageUrl,
                        title: item.title,
                        releaseDate: item.releaseDate,
                        videoId: videoId!,
                      );
                    },
                  );
                }
              },
            ),
    );
  }
}
