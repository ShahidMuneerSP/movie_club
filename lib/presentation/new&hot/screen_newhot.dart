

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_club/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:movie_club/core/colors.dart';
import 'package:movie_club/core/constants.dart';

class ScreenNewHot extends StatelessWidget {
  const ScreenNewHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              title: const Text(
                'Hot & New',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              actions: [
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
                ),
                KWidth,
              ],
              bottom: TabBar(
                  indicator: BoxDecoration(
                    color: KWhiteColor,
                    shape: BoxShape.rectangle,
                    borderRadius: KRadius30,
                  ),
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelColor: KWhiteColor,
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: " 👀 Everyone's Watching",
                    )
                  ]),
            ),
          ),
          body:  const TabBarView(
            children: [
              ComingSoonList(key:Key('coming_soon') , ),
              EveryOnesWatchingList(key: Key('everyone_is_watching'),),
            ],
          )),
    );
  }
}
class ComingSoonList extends StatelessWidget{
  const ComingSoonList({Key? key}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    },);
    return RefreshIndicator(
      onRefresh: () async{ 
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
       },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
          builder: (context, state) {
        if (state.isloading) {
          const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          const Center(child: Text("Error while getting data"));
        } else if (state.comingSoonList.isEmpty) {
          const Center(
            child: Text("List is Empty"),
          );
        }
    
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10),
            itemCount: state.comingSoonList.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              log(movie.releaseDate.toString());
              String month = '';
              String day ='';
              try{
               final _date = DateTime.tryParse(movie.releaseDate!);
                final formatedDate =   DateFormat. yMMMMd('en_US').format(_date!);
                   log(formatedDate.toString());
                month = formatedDate.split(' ').first.substring(0,3).toUpperCase();
                day = movie.releaseDate!.split('-')[1];
              }catch(_){
               month='';
               day='';
              }
              return ComingSoonWidget(
    
                day: day,
                description: movie.overview ?? 'No Description',
                id: movie.id.toString(),
                month:month ,
                movieName: movie.originalTitle ?? 'No title',
                posterPath: '$imageAppendUrl${movie.posterPath}',
              );
            });
      
      }
      ),
    );
  }
  
}
class EveryOnesWatchingList extends StatelessWidget{
  const EveryOnesWatchingList({Key? key}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
          BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInEveryOneIsWatching());
    });
   return  RefreshIndicator(
     onRefresh: ()async {  
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInEveryOneIsWatching());
     },
     child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
            if (state.isloading) {
          const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          const Center(child: Text("Error while getting data"));
        } else if (state.everyOnesWatchingList.isEmpty) {
          const Center(
            child: Text("List is Empty"),
          );
        }
          return ListView.builder(
            itemCount: state.everyOnesWatchingList.length,
            itemBuilder: (BuildContext context,int  index) {
              final tv = state.everyOnesWatchingList[index];
              return  EveryOnesWatchingWidget(
                description: tv.overview??'No description',
                movieName: tv.originalName??'No name provided',
                posterPath: '$imageAppendUrl${tv.posterPath}',
              );
            },
          );
        },
      ),
   );
  }
  }
  

class EveryOnesWatchingWidget extends StatelessWidget {
 
  final String posterPath;
  final String movieName;
  final String description;

  const EveryOnesWatchingWidget(
      {Key? key,
    
      required this.posterPath,
      required this.movieName,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Khight,
        Row(
          children:  [
            Expanded(
              child: Text(
                movieName,
                
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Khight,
        Row(
          children:  [
            Expanded(
              child: Text(
                     description,   
                     maxLines: 10,
                        overflow: TextOverflow.clip,                 
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        Khight40,
        Row(children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: size.width,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          posterPath
                           ))),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(
                        Icons.volume_off,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )),
              ),
            ],
          ),
        ]),
        Khight20,
        Row(
          children: [
            const Spacer(),
            Column(children: const [
              Icon(
                Icons.share,
                color: Colors.white,
              ),
              Text(
                "Share",
                style: TextStyle(color: Colors.grey),
              ),
            ]),
            KWidth,
            Column(children: const [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "My List",
                style: TextStyle(color: Colors.grey),
              ),
            ]),
            KWidth,
            Column(children: const [
              Icon(
                Icons.info,
                color: Colors.white,
              ),
              Text(
                "Info",
                style: TextStyle(color: Colors.grey),
              ),
              KWidth,
            ])
          ],
        )
      ],
    );
  }
}

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Text(
                month,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                day,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
            width: size.width - 50,
            height: 500,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                             posterPath),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            icon: const Icon(
                              Icons.volume_off,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          )),
                    ),
                  ],
                ),
                Khight,
                 MovieNameRowWidget(movieName: movieName,),
                Row(
                  children:  [
                    Text('Coming on $day $month'),
                  ],
                ),
                Khight,
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://wallpaperaccess.com/full/2772922.png"),
                        ),
                      ),
                    ),
                    const Text(
                      "FILM",
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
                Row(
                  children:  [
                    Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children:  [
                    Expanded(
                      child: Text(
                          description,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          ),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}

class MovieNameRowWidget extends StatelessWidget {
  final String movieName;
  const MovieNameRowWidget({
    Key? key,
     required this.movieName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          Expanded(
            child: Text(
            movieName,
              maxLines: 1,
                   overflow: TextOverflow.clip,
            style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
          ),
       
        Column(
          children: const [
            Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
            Text(
              'Remind Me',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        KWidth,
        Column(
          children: const [
            Icon(
              Icons.info_outline,
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
        KWidth,
      ],
    );
  }
}
