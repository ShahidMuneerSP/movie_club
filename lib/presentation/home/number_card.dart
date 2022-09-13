
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_club/core/constants.dart';



class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index}) : super(key: key);
final int index;
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
           image: const DecorationImage(
            fit: BoxFit.cover,
             image:NetworkImage("https://www.themoviedb.org/t/p/w600_and_h900_bestv2/62HCnUTziyWcpDaBO2i1DX17ljH.jpg",),
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