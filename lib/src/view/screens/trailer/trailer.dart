import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/domain/entities/trailer.dart';
import 'package:movie_app/src/view/widgets/back_app_bar.dart';
import 'package:movie_app/src/view/screens/trailer/movie_trailer_controller.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPage extends StatefulWidget {
  const TrailerPage({Key key, this.movie}) : super(key: key);
  final MovieEntity movie;

  @override
  _TrailerPageState createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  var _getMovieTrailerList;

  @override
  void initState() {
    super.initState();
    _getMovieTrailerList = Provider.of<MovieTrailerController>(this.context, listen: false).getTrailers(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(context),
      body: Center(
        child: FutureBuilder<List<TrailerEntity>>(
          future: _getMovieTrailerList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var videoId = Provider.of<MovieTrailerController>(context).getYouTubeId(widget.movie.id);

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
                valueColor: AlwaysStoppedAnimation<Color>(AppColor.yellow),
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
