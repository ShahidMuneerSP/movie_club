import 'package:flutter/material.dart';
import 'package:movie_club/core/colors.dart';
import 'package:movie_club/core/constants.dart';

class ScreenNewHot extends StatelessWidget {
  const ScreenNewHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: AppBar(
              title:   const Text(
          'Hot & New',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 30,
          fontWeight: FontWeight.bold),
          ),
          actions: [
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
          bottom: TabBar(
            indicator: BoxDecoration(
              color: KWhiteColor,
              shape: BoxShape.rectangle,
              borderRadius: KRadius30,
              
            ),
             labelColor: Colors.black,
             labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
             ),
            unselectedLabelColor: KWhiteColor,
            tabs: const [
              Tab(  
               text: '🍿 Coming Soon',),
              Tab(text:" 👀 Everyone's Watching",)
            ]),
            
              ),),
          body:
          TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],)
    
    
        
      ),
    );
  }
  
 Widget _buildComingSoon() {
    
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) { 
return 
      const ComingSoonWidget();
    
   },
    
  );

  }
  
 Widget _buildEveryonesWatching() {
    return ListView.builder(itemBuilder: (context, index) {
      return EveryOnesWatchingWidget();
    },
    );
  }
  
}

class EveryOnesWatchingWidget extends StatelessWidget {
  const EveryOnesWatchingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
   return Column(
    children:[
  Khight,
   Row(
    children: const[
      Text("Friends",style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
    ],
   ),
   Khight,
   Row(
    children:const [ 
      Text("Six young people from New York City, on their own \n and struggling to survive in the real world, find the \n companionship, comfort and support they get \n from each other to be the perfect antidote to the \n pressures of life.",
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.grey,
      ),),  
    ],
   ),
 Khight40,
   Row(
    children: [   
      Stack(
        children:[
           Container(
          height: 200,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/l0qVZIpXtIo7km9u5Yqh0nKPOr5.jpg"
              )
            )
          ),
        
      ),
       Positioned(
        bottom: 10,
        right: 10,
         child: CircleAvatar(
                   radius: 30,
                   backgroundColor: Colors.black,
                   child: IconButton(
                     icon: Icon(Icons.volume_off,color: Colors.white,),
                      onPressed: () {  },
                      )
                      ),
       ),
      
    ],
   ),
    ]
   ),
   Khight20,
   Row(
    children: [
    const  Spacer(),
      Column(
        children:const[
      Icon(Icons.share,color: Colors.white,), 
      Text("Share",style: TextStyle(color: Colors.grey),),
        ]
      ),
      KWidth,
       Column(
        children:const[
      Icon(Icons.add,color: Colors.white,), 
      Text("My List",style: TextStyle(color: Colors.grey),),
        ]
      ),
      KWidth,
       Column(
        children:const[
      Icon(Icons.info,color: Colors.white,), 
      Text("Info",style: TextStyle(color: Colors.grey),),
      KWidth,
        ]
      )
      

    ],
   )
 ],
   );
  }
}

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
    
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Row(
      children: [
      SizedBox(
        width: 50,
        height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const[
          Text("SEP",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),),
          Text("11",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
        ],
      ),),
     
        SizedBox(
        width: size.width - 50,
        height: 500,
        child:Column(
          children: [
            Stack(
              children: [
                Container(
                  height:170 ,
                  width:double.infinity ,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/aRJjCgp4uVUkXhDw8NClesQXbt3.jpg"
                        
                      ),
                      ),
                       ),
                ),
                 Positioned(
                 bottom: 10,
                 right: 10,
                   child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.black,
                                  child: IconButton(
                   icon: const Icon(Icons.volume_off,color: Colors.white,),
                    onPressed: () {  },
                    )
                    ),
                 ),
              ],
            ),
            Khight,
            const MovieNameRowWidget(),
            
            Row(
              children: const [
                Text('Coming on Friday'),
              ],
            ),
            Khight,
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpaperaccess.com/full/2772922.png"
                      ),
                      ),
                  ),
                ),
                const Text("FILM",style: TextStyle(
                  fontSize: 13
                ),)
              ],
            ),
            Row(
               children:const [
                Text("Hunt",style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),),
               ],
            ),
            Row(
              children:const [
                Text(
                  "Agents of the Korean National Intelligence \n Service (KNIS), Pyung-ho at Int’l Dept. and \n Jung-do at Domestic Dept. are both \n independently hunting a North Korean \n mole within the agency. During this\n investigation, they come face to face with \n an unbearable truth and yet must \n complete their own missions at all costs."
                )
              ],
            )
          ],
        )
      )
    ],
  );
  }
}

class MovieNameRowWidget extends StatelessWidget {
  const MovieNameRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Hunt (2022)",style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold
        ),),
        const Spacer(),
         Column(
                  children:const [
                  Icon(Icons.notifications_none,color: Colors.white,),
                  Text('Remind Me',style: TextStyle(
                      fontWeight: FontWeight.bold,
                  ),)
                  ],
                ),
                KWidth,
        Column(
                  children:const [
                  Icon(Icons.info_outline,color: Colors.white,),
                  Text('Info',style: TextStyle(
                      fontWeight: FontWeight.bold,
                  ),)
                  ],
                ),
                KWidth,
          
        
      ],
    );
  }
}