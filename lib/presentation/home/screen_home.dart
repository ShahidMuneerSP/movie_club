import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_club/application/home/home_bloc.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/presentation/home/number_card.dart';
import 'package:movie_club/presentation/search/widgets/title.dart';
import 'package:movie_club/presentation/widgets/main_card.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: ScrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                print(direction);

                if (direction == ScrollDirection.reverse) {
                  ScrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  ScrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if(state.isLoading)
                      {
                        return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                      }
                     else  if(state.hasError)
                      {
                           return const Text("Error while getting data",style: TextStyle(color: Colors.white),);
                      }

                      final _releasedPastYear = state.pastYearMovieList.map((m){
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _releasedPastYear.shuffle();

                       final _trending = state.trendingMovieList.map((m){
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _trending.shuffle();

                         final _tenseDramas = state.tenseDramasMovieList.map((m){
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _tenseDramas.shuffle();

                         final _southIndianMovies = state.southIndianMovieList.map((m){
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _southIndianMovies.shuffle();

                       final _top10TvShow = state.trendingTvList.map((t){
                        return '$imageAppendUrl${t.posterPath}';
                      }).toList();
                      _top10TvShow.shuffle();
                      print(_top10TvShow.length);
 

                      return ListView(children: [
                        Stack(children: [
                          Container(
                            width: double.infinity,
                            height: 550,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg"),
                            )),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'MyList',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                _playButton(),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Info',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                        if(_releasedPastYear.length>=10)
                         MainTitleCard(
                          posterList: _releasedPastYear.sublist(0,10),
                          title: 'Released in the past year',
                        ),
                        Khight,
                        if(_trending.length>=10)
                         MainTitleCard(
                          posterList: _trending.sublist(0,10),
                          title: 'Trending Now',
                        ),
                        Khight,
                        if(_top10TvShow.length>=10)
                          NumberWidget(posterList:_top10TvShow.sublist(0,10),),
                        Khight,
                        if(_tenseDramas.length>=10)
                         MainTitleCard(
                          posterList: _tenseDramas.sublist(0,10),
                          title: 'Tense Dramas',
                        ),
                        Khight,
                        if(_southIndianMovies.length>=10)
                         MainTitleCard(
                          posterList: _southIndianMovies.sublist(0,10),
                          title: 'South Indian Cinema',
                        ),
                        Khight
                      ]);
                    },
                  ),
                  ScrollNotifier.value == true
                      ? AnimatedContainer(
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.3),
                          duration: const Duration(milliseconds: 1000),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Image(
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://wallpaperaccess.com/full/2772922.png"),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  KWidth,
                                  Container(
                                    color: Colors.teal[900],
                                    width: 30,
                                    height: 30,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'TV Shows',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  KWidth,
                                  Text('Movies',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  KWidth,
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  KWidth
                                ],
                              )
                            ],
                          ),
                        )
                      : Khight
                ],
              ),
            );
          }),
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key, required this.posterList,
  }) : super(key: key);
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top 10 TV Shows in India Today',
        ),
        Khight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(posterList.length, (index) {
              return NumberCard(
                index: index + 1, imageUrl: posterList[index],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);
  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: title,
        ),
        Khight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(posterList.length, (index) {
              return MainCard(
                imageUrl: posterList[index],
              );
            }),
          ),
        ),
      ],
    );
  }
}
