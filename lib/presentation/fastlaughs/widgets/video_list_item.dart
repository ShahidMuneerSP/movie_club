import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_club/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:movie_club/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../application/fast_laugh/fast_laugh_bloc.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  VideoListItemInheritedWidget(
      {required this.movieData, required this.widget, Key? key})
      : super(key: key, child: widget);
  final Widget widget;
  final Downloads movieData;

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(children: [
      FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //left side
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(
                      Icons.volume_off,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )),
              //right side
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage("$imageAppendUrl$posterPath"),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: likedVideosIdsNotifier,
                    builder: (BuildContext context, Set<int> newLikedListIds,
                        Widget? _) {
                      final _index = index;
                      if (newLikedListIds.contains(_index)) {
                        return GestureDetector(
                          onTap: (() {
                            // BlocProvider.of<FastLaughBloc>(context).add(UnLikeVideo(id: index));
                            likedVideosIdsNotifier.value.remove(_index);
                            likedVideosIdsNotifier.notifyListeners();
                          }),
                          child:  const VideoActionWidget(
                              icon: Icons.favorite_outline ,title: 'Liked'
                        ),
                        );
                      }

                      return GestureDetector(
                        onTap: (() {
                          // BlocProvider.of<FastLaughBloc>(context).add(LikeVideo(id: index));
                          likedVideosIdsNotifier.value.add(_index);
                          likedVideosIdsNotifier.notifyListeners();
                        }),
                        child: const VideoActionWidget(
                            icon: Icons.emoji_emotions, title: 'LOL'),
                      );
                    },
                  ),
                  const VideoActionWidget(icon: Icons.add, title: 'My List'),
                  GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionWidget(
                          icon: Icons.share, title: 'Share')),
                  const VideoActionWidget(
                      icon: Icons.play_arrow, title: 'Play'),
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;

  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => FastLaughVideoPlayerState();
}

class FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _videoPlayerController.value.isInitialized
            ? VideoPlayer(_videoPlayerController)
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
