
import 'package:flutter/material.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/presentation/search/widgets/title.dart';
const url = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mmwoi6JV6e8wltQdZvqrSJjff7O.jpg";
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
          child:GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.4,
            children: List.generate(30, (index) {
              return const MainCard();
            }
            ),
            ),
        ),
       
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(url)),
        borderRadius: BorderRadius.circular(6)
        ),
      
    );
  }
}