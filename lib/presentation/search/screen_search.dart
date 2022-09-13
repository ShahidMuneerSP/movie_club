import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_club/application/search/search_bloc.dart';
import 'package:movie_club/application/search/search_bloc.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/presentation/search/widgets/search_idle.dart';
import 'package:movie_club/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
    BlocProvider.of<SearchBloc>(context).add(const Initialize());


    });
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,),
                backgroundColor: Colors.grey[900],
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
              style: const TextStyle(color: Colors.white),
              ),
              Khight,
              // const Expanded(child: SearchIdleWidget()),
                const Expanded(child: SearchIdleWidget()),
            ]
          ),
        ),
      )
    );
  }
}