import 'package:flutter/material.dart';
import 'package:movie_club/presentation/downloads/screen_downloads.dart';
import 'package:movie_club/presentation/fastlaughs/screen_fastlaughs.dart';
import 'package:movie_club/presentation/home/screen_home.dart';
import 'package:movie_club/presentation/main_page/widgets/bottom_nav.dart';
import 'package:movie_club/presentation/new&hot/screen_newhot.dart';
import 'package:movie_club/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget{
  ScreenMainPage({Key? key}) : super(key: key);
final  _pages =[
   ScreenHome(),
   ScreenNewHot(),
    ScreenFastLaughs(),
    ScreenSearch(),
   ScreenDownloads(),
];
  @override
  Widget build(BuildContext context) {
   
       return SafeArea(
         child: Scaffold(
          
          body: ValueListenableBuilder(
            valueListenable:indexChangeNotifier ,
           builder: (context, int index, _) {
             return  _pages[index];
  
           },),
  
         
             bottomNavigationBar:   const BottomNavigationWidget(),
         ),
       );
     }
   
  }


