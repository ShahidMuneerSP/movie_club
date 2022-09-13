

import 'package:flutter/material.dart';
import 'package:movie_club/core/constants.dart';

class  AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        const Spacer(),
      const Icon(
        Icons.cast,
        color: Colors.white,
        size: 30,),
       KWidth,
      Container(color: Colors.teal[900],
      width:30 ,
      height: 30,),
        KWidth,
       
      
    ],
    );
  }
}