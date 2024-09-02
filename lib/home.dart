import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final TextEditingController _Textcontroller = TextEditingController();

  @override
  //List<String> favoriteItems = [];
  void initState() {
    super.initState();
    _Textcontroller.text = "Loading quote....";
    _loadSavedData();
    _updateQuoteOnceADay();// Load saved data when the app starts
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedText = prefs.getString('savedText') ?? '';
    _Textcontroller.text = savedText;
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedText', _Textcontroller.text);
    //favoriteItems.add('Favorite Item ${favoriteItems.length + 1}');
    // Data is saved locally
  }
  // void initState() {
  //   super.initState();
  //   _Textcontroller.text = "Tap to generate a quote";
  // }
  Future<void> _updateQuoteOnceADay() async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetchedTime = prefs.getInt('lastFetchedTime');
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if(lastFetchedTime==null || currentTime - lastFetchedTime > 24* 60 * 60 * 1000){
      final response = await http.get(Uri.parse('https://api.adviceslip.com/advice'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() async {
          await prefs.setInt('lastFetchedTime', currentTime);
          await prefs.setString('lastFetchedQuote', data['slip']['advice']);

        });
      } else {
        setState(() {
          _Textcontroller.text = 'Failed to load a quote';
        });
      }

    } else {
      final lastFetchedQuote = prefs.getString('lastFetchedQuote') ?? 'No quote available';
      setState(() {
        _Textcontroller.text =  lastFetchedQuote;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffeff4ff),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 60.h, 8.w, 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Quote of the Day",style: TextStyle(color: const Color(0xff4a5a66),fontSize: 35.sp,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(
              height: 90.h,
            ),
            Container(
              width: 300.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(12.w, 40.h, 12.w, 15.h),
                child: Text(_Textcontroller.text,
                  style: TextStyle(color: const Color(0xff8a8a8a),fontSize: 20.sp,fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  maxLines: 150,
                ),
              ),
            ),
             SizedBox(height: 15.h,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent
                  ),
                  child: TextButton(onPressed:(){}, child:Text("ate",
                    style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent
                  ),
                  child: TextButton(onPressed: _saveData,//(){

                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavoritePage(Text: _Textcontroller.text)));
                 // },
                    child:Text("Save",
                    style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                ),
                //IconButton(onPressed: sharePressed, icon: Icon(Icons.share, color: Colors.redAccent,)),
                SizedBox(
                  width: 30.w,
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent
                  ),
                  child: TextButton(onPressed:sharePressed, child: Text("Share",
                    style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),

    );
  }
  void sharePressed() {
    String message = (_Textcontroller.text);
    Share.share(message);

  }
}

