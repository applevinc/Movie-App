import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/video.dart';
import 'package:movie_app/ui/components/backAppBar.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';
import 'package:movie_app/viewModels/videoViewModel.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPage extends StatefulWidget {
  const TrailerPage({Key key, this.movie}) : super(key: key);
  final MovieViewModel movie;

  @override
  _TrailerPageState createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  var _getMovieTrailerList;

  @override
  void initState() {
    super.initState();
    _getMovieTrailerList = Provider.of<VideoViewModel>(this.context, listen: false).getTrailers(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(context),
      body: Center(
        child: FutureBuilder<List<Video>>(
          future: _getMovieTrailerList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var videoId = Provider.of<VideoViewModel>(context).getYouTubeId(widget.movie.id);

              YoutubePlayerController _playerController = YoutubePlayerController(
                initialVideoId: videoId,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: true,
                ),
              );

              return YoutubePlayer(
                controller: _playerController,
                showVideoProgressIndicator: true,
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kYellow),
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSize _buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: BackAppBar(
        onBackTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
