import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/video.dart';
import 'package:movie_app/ui/constants/color.dart';
import 'package:movie_app/ui/constants/text.dart';
import 'package:movie_app/ui/widgets/back_app_bar.dart';
import 'package:movie_app/viewModels/movie_view_model.dart';
import 'package:movie_app/viewModels/video_view_model.dart';
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
                //initalVideoId cannot be null
                initialVideoId: (videoId != null) ? videoId : 'No Video',
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              );

              return (videoId != null)
                  ? YoutubePlayer(
                      controller: _playerController,
                      showVideoProgressIndicator: true,
                    )
                  : Center(
                      child: Text(
                        'Trailer not available',
                        style: kSubHeadline,
                      ),
                    );
            } else if (snapshot.hasError) {
              return Text(
                "${snapshot.error}",
                style: kSubHeadline,
              );
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
