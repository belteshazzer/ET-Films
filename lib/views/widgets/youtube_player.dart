import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewReleasePlayer extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String releaseDate;
  final String videoId;

  const NewReleasePlayer({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.releaseDate,
    required this.videoId,
  }) : super(key: key);

  @override
  State<NewReleasePlayer> createState() => _NewReleasePlayerState();
}

class _NewReleasePlayerState extends State<NewReleasePlayer> {
  late YoutubePlayerController _headerController;

  @override
  void initState() {
    super.initState();
    _headerController = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Stack(
        children: [
          YoutubePlayer(
            controller: _headerController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    widget.releaseDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}