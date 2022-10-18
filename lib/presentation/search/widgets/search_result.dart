
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_club/application/search/search_bloc.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/presentation/search/widgets/title.dart';
import 'package:tmdb_api/tmdb_api.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const SearchTextTitle(title: 'Movies & TV',),
        Khight,
        Expanded(
        child:  BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.4,
                      children: List.generate(19,
                       (index) {
                        final movie = state.searchResultList[index];
                        return  MainCard(imageUrl: movie.posterImageUrl);
                      }
                      ),
                      );
            },
          ),
        ),
       
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    Key? key, required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
      image:  DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(imageUrl)),
        borderRadius: BorderRadius.circular(6)
        ),
      
    );
  }
}