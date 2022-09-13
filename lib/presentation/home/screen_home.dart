import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_club/core/colors.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/presentation/home/number_card.dart';
import 'package:movie_club/presentation/search/widgets/title.dart';
import 'package:movie_club/presentation/widgets/main_card.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);
class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ValueListenableBuilder(
        valueListenable: ScrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          print(direction);
          
          if(direction == ScrollDirection.reverse){
            ScrollNotifier.value = false;
          }else if(direction == ScrollDirection.forward){
            ScrollNotifier.value = true;
          }
          return true;
        },
        child: Stack(
          children: [
            ListView(
                children:[
                     
                  Stack(
                    children: [
                      Container(
                      width: double.infinity,
                      height: 550,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg"
                          ),
                        )
                      ),
                    ),  
                    
                    
                        
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              children:const [
                              Icon(Icons.add,color: Colors.white,),
                              Text('MyList',style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          _playButton(),
                             Padding(
                               padding: const EdgeInsets.only(bottom: 10),
                               child: Column(
                            children:const [
                            Icon(Icons.info,color: Colors.white,),
                            Text('Info',style: TextStyle(
                                fontWeight: FontWeight.bold,
                            ),)
                            ],
                          ),
                             ),
                              
                        ],
                      ),
                    )
                    ]
                  ),
               const MainTitleCard(title: 'Released in the past year',),
               Khight,
               const MainTitleCard(title: 'Trending Now'),
               Khight,
              const NumberWidget(),
              Khight,
               const MainTitleCard(title: 'Tense Dramas'),
               Khight,
               const MainTitleCard(title: 'South Indian Cinema'),
               Khight
                ]
                  ),
              ScrollNotifier.value == true ? 
               AnimatedContainer(
                width: double.infinity,
                height: 90,
                color: Colors.black.withOpacity(0.3),
               
              duration: const Duration(milliseconds: 1000),
              child:     Column(
                children: [
                  Row(
                           children: [
                            const Image(
                            height: 70,
                            width: 70,
                              fit: BoxFit.cover,
                              image: NetworkImage("https://wallpaperaccess.com/full/2772922.png"),
                             ),             
                            
                      
                            
                                 const Spacer(),
                              const Icon(
                                 Icons.cast,
                                 color: Colors.white,
                                 size: 30,),
                                KWidth,
                                Container(color: Colors.teal[900],
                                width:30,
                                height: 30,)
                                
                                
                           ],
                              ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children:const [
                              Text('TV Shows',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),),
                              KWidth,
                              Text('Movies',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                                )),
                                KWidth,
                              
                              Text('Categories',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                                ),
                                ),
                              KWidth
                            ],
                           
                                        )
                ],
              ),
               ):Khight  
          ],
        ),
          );
      
        }
        ),
      
      
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                    onPressed: () { }, 
                    icon: const Icon(Icons.play_arrow,color: Colors.black,),
                     label: const Padding(
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       child: Text('Play',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                       ),
                        ),
                     ),
                      );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     const SearchTextTitle(title: 'Top 10 TV Shows in India Today',
     ), 
     Khight,  
     LimitedBox(
      maxHeight: 200,
       child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
       return    NumberCard(index: index+1,) ;
        }),
       ),
     ),
      ],

    );
  }
}

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key, 
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     SearchTextTitle(title: title,
     ), 
     Khight,  

     LimitedBox(
      maxHeight: 200,
       child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
       return   const MainCard() ;
        }),
       ),
     ),
      ],

    );
  }
}

  
