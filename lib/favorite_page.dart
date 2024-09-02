import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {

  final String Text;

  const FavoritePage({required this.Text});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String savedText = '';
  List<String> savedItems = [];

  @override
  void initState() {
    super.initState();
    _loadSavedData();  // Load the saved data when the page initializes
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedText = prefs.getString('savedText') ?? 'No saved data';
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffeff4ff),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
            children: [
              Text("Favorites",style: TextStyle(color:const Color(0xff4a5a66),fontWeight: FontWeight.bold,fontSize: 30.sp),)
            ],
            ),
            SizedBox(height: 20.h,),
            Container(
              width: 300.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(12.w, 40.h, 12.w, 15.h),
                child: SingleChildScrollView(
                  //controller: Text,
                  child: Text(savedText,
                     style: TextStyle(color: const Color(0xff8a8a8a),fontSize: 20.sp,fontWeight: FontWeight.w500),
                     textAlign: TextAlign.center,
                     maxLines: 150
              ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
