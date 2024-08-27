import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.error,color: Colors.white,size: 150.r,)),
          Center(child: Text("No Downloads Yet",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.white),)),
        ],
      ),
    );
  }
}
