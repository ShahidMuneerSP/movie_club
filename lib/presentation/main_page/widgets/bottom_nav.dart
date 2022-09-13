import 'package:flutter/material.dart';
ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);
class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier, 
      builder: (  context, int newIndex, _) {
        return BottomNavigationBar(
      currentIndex: newIndex,
      onTap:(index) {
        indexChangeNotifier.value = index;
      }, 
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      type: BottomNavigationBarType.fixed,
      items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.collections_outlined),label: 'Hot&New'),
        BottomNavigationBarItem(icon: Icon(Icons.tag_faces_rounded ),label: 'FastLaughs'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.download),label: 'Downloads'),
      ]);
      },);
  }
}