import 'package:flutter/material.dart';
import 'package:quote/favorite_page.dart';
import 'package:quote/home.dart';
import 'package:quote/home_page.dart';
import 'package:quote/reload_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedPage = 0;

  final _pageOptions = [
    const HomePages(),
    const FavoritePage(),
    const ReloadPage()
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor:Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        currentIndex: selectedPage,
        onTap: (index){
          setState(() {

            selectedPage = index;
          });
        },
        items: const[
          BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home,)),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              label: " ",
              icon: Icon(Icons.favorite,)),
          BottomNavigationBarItem(
              label: "  ",
              icon: Icon(Icons.download_for_offline_sharp,)),
        ],
      ),
    );
  }
}