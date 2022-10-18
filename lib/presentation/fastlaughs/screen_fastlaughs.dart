import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_club/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/presentation/fastlaughs/widgets/video_list_item.dart';
import 'package:video_player/video_player.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            } else if (state.isError) {
              return const Center(child: Text("Error while getting data"));
            } else if (state.videosList.isEmpty) {
              return const Center(child: Text("VideoList is Empty"));
            }
            else{
                return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videosList.length, (index) {
                return VideoListItemInheritedWidget(
                widget:VideoListItem(
                  key:Key(index.toString()),
                  index: index, ) ,
                movieData: state.videosList[index],
                );
              }),
            );
            }
          
          },
        ),
      ),
    );
  }
}
