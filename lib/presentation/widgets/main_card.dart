import 'package:flutter/material.dart';
import 'package:movie_club/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 150,
    height: 250,
    decoration:
     BoxDecoration(
       borderRadius: KRadius20,
     image: const DecorationImage(
       image:NetworkImage("https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ipn8khVVC4eToWiGf89WF9J5PJn.jpg"),
       ),
        ),
    );
  }
}