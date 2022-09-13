

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_club/application/downloads/downloads_bloc.dart';
import 'package:movie_club/core/colors.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/domain/downloads/models/downloads.dart';
import 'package:movie_club/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                title: 'Downloads',
              )),
          body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (BuildContext context, int index) {
              return _widgetList[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 25);
            },
            itemCount: _widgetList.length,
          )),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
          BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImage());
     });
    

         final Size size = MediaQuery.of(context).size;
   

    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Khight,
        const Text(
          "We'll download a personalised selection \n movies and shows for you ,so there's \n  always something to watch on your \n device.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        Khight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return
             SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading ?    const Center(child: CircularProgressIndicator()): Stack(
                alignment: Alignment.center, 
                children: [
                  
                CircleAvatar(
                    radius: size.width * 0.39,
                    backgroundColor: Colors.grey[900]),
                DownloadsImageWidget(
                  imageList:'$imageAppendUrl${state.downloads[0].posterPath}',
                  size: Size(size.width * 0.35, size.width * 0.55),
                  margin: const EdgeInsets.only(left: 170, top: 40),
                  angle: 20,
                ),
                DownloadsImageWidget(
                  imageList:'$imageAppendUrl${state.downloads[1].posterPath}',
                  size: Size(size.width * 0.35, size.width * 0.55),
                  margin: const EdgeInsets.only(right: 170, top: 40),
                  angle: -20,
                ),
                DownloadsImageWidget(
                  imageList:'$imageAppendUrl${state.downloads[2].posterPath}',
                  size: Size(size.width * 0.4, size.width * 0.6),
                  margin: const EdgeInsets.only(bottom: 10, top: 40),
                  radius: 8,
                ),
              ]),
            );
           }
          
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: KButtonColorBlue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {}),
      ),
      Khight,
      MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: KButtonColorWhite,
          child: const Text(
            'See what you can download',
            style: TextStyle(
                color: backgroundColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {}),
    ]);
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children:const [
      Icon(Icons.settings, color: KWhiteColor),
      KWidth,
      Text('Smart Downloads')
    ]);
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
