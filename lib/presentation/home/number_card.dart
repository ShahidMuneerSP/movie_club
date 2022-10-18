
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_club/core/constants.dart';



class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index, required this.imageUrl}) : super(key: key);
final int index;
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:[
         Row(
        children: [
          const SizedBox(
            width: 40,
            height: 200,
          ),
          Container(
          width: 130,
          height: 200,
          decoration:
           BoxDecoration(
             borderRadius: KRadius10,
           image:  DecorationImage(
            fit: BoxFit.cover,
             image:NetworkImage(imageUrl),
             ),
              ),
          ),
        ],
      ),
      Positioned(
        bottom: -25,
        left: 13,
        child: BorderedText(
          strokeWidth: 10.0,
          strokeColor: Colors.white,
          child: Text(
            "$index",style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 120,
              color: Colors.black,
              decoration: TextDecoration. none,
              decorationColor: Colors.black,
              
             
             
             
             
          ),
          ),
        ),
      ),
      ]
      );
      
    
  }
}