import 'package:flutter/material.dart';
import 'package:movie_app_demo/view/pages/home.dart';
import 'package:movie_app_demo/view/pages/movies.dart';
import 'package:movie_app_demo/view/pages/profile.dart';
import 'package:movie_app_demo/view/pages/tvshow.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex=0;
  final List<Widget> screens= const[
      Home(),
      Movies(),
      Tvshow(),
      Profile(),
  ];
 final List<BottomNavigationBarItem> navitems=const[
  BottomNavigationBarItem(icon: Icon(Icons.home,color: Color.fromARGB(255, 31, 64, 141),),label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.movie_outlined,color:  Color.fromARGB(255, 31, 64, 141),),label: 'Movies'),
  BottomNavigationBarItem(icon: Icon(Icons.tv,color:  Color.fromARGB(255, 31, 64, 141)),label: 'TV shows'),
  BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined,color: Color.fromARGB(255, 31, 64, 141),),label: 'Me')
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items:navitems,
          selectedItemColor: Colors.white,
          iconSize: 26,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              currentIndex=index;
            });
          },
        ),
    );
  }
}