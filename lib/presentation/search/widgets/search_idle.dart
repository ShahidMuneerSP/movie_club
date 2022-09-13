import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_club/application/search/search_bloc.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/presentation/search/widgets/title.dart';



class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        Khight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if(state.isLoading)
              {
              const  Center(child: CircularProgressIndicator(),);
              }
              else if(state.isError){
                const  Center(child: Text("Error while getting data"),);
              }else if(state.idleList.isEmpty){
                 const  Center(child: Text("List is empty"),);
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return  TopSearchItemTile(title: movie.title?? 'No title provided', imageUrl:'$imageAppendUrl${movie.posterPath}',);
                  },
                  separatorBuilder: (context, index) {
                    return Khight;
                  },
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
    {Key? key,
     required this.title, 
     required this.imageUrl}
     ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.3,
          height: 65,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: screenWidth * 0.4,
            height: 65,
            child:  Text(title,
                style:const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center),
          ),
        ),
        SizedBox(
            width: screenWidth * 0.2,
            height: 65,
            child: const Icon(
              Icons.play_circle_outline,
              size: 45,
              color: Colors.white,
            )),
      ],
    );
  }
}
