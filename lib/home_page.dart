import 'package:flutter/material.dart';
//import 'package:quote/bottom_nav.dart';
import 'package:quote/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      //backgroundColor: Colors.blueAccent,

      body: BottomNavExample(),
      //backgroundColor: Colors.black12,

    );
  }
}
