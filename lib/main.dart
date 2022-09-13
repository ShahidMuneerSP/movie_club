import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_club/application/downloads/downloads_bloc.dart';
import 'package:movie_club/application/search/search_bloc.dart';
import 'package:movie_club/core/colors.dart';
import 'package:movie_club/domain/core/di/injectable.dart';
import 'package:movie_club/presentation/main_page/screen_main_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await confingureInjection();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (ctx) =>getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) =>getIt<SearchBloc>()),
      ],
      child: MaterialApp(
        title: 'Netflix App',
          debugShowCheckedModeBanner: false,
        theme: ThemeData(   
          appBarTheme:const AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily: GoogleFonts.montserrat().fontFamily, 
          primarySwatch: Colors.blue,
         scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          )
        ),
        home:  ScreenMainPage(),
      ),
    );
  }
}
