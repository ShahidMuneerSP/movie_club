

import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem ({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(
        color: Colors.accents[index % Colors.accents.length],
      ),
       Align(
        alignment: Alignment.bottomCenter,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //left side
                CircleAvatar(
                 radius: 30,
                 backgroundColor: Colors.black,
                 child: IconButton(
                   icon: Icon(Icons.volume_off,color: Colors.white,),
                    onPressed: () {  },
                    )
                    ),
                    //right side
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                     children:const [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                             "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mmwoi6JV6e8wltQdZvqrSJjff7O.jpg",
                          ),
                        ),
                      ),
                      VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                      VideoActionWidget(icon: Icons.add, title: 'My List'),
                      VideoActionWidget(icon: Icons.share, title: 'Share'),
                      VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                     
                      
                     ],
                    )
              ],
            ),
         ),
       ),
      
      ]
    );
  }
}
class VideoActionWidget extends StatelessWidget{
  const VideoActionWidget({
    Key? key,
     required this.icon, 
     required this.title,
     }) : 
     super(key: key);

final IconData icon;
final String title;
  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: Column(
      children:[
     Icon(
      icon,
      color: Colors.white,
      size: 30,),
     Text(title,style: const TextStyle(
      color: Colors.white,
     ),),
      ]
    ),
  );
  }

}