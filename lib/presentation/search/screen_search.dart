import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_club/application/search/search_bloc.dart';
import 'package:movie_club/application/search/search_bloc.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/domain/core/debounce/debounce.dart';
import 'package:movie_club/presentation/search/widgets/search_idle.dart';
import 'package:movie_club/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
   ScreenSearch({Key? key}) : super(key: key);

final _debouncer  = Debouncer(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CupertinoSearchTextField(
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              backgroundColor: Colors.grey[900],
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                if(value.isEmpty){
                  return;
                }
                _debouncer.run(() {
                   BlocProvider.of<SearchBloc>(context)
                    .add(SearchMovies(movieQuery: value));
                });
               
              }),
          Khight,
           Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if(state.searchResultList.isEmpty){
                    return const SearchIdleWidget();
              }else{
                return const SearchResultWidget();
              }
             
            },
          )),
        ]),
      ),
    ));
  }
}
