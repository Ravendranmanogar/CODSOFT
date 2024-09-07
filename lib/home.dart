import 'dart:convert';


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
  String _Textcontroller = '';

  @override
  void initState() {
    super.initState();
    _Textcontroller = "Loading quote....";
    _updateQuoteOnceADay();
  }

  void _saveQuote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedQuotes = prefs.getStringList('savedQuotes') ?? [];
    savedQuotes.add(_Textcontroller); // Add the new quote
    await prefs.setStringList('savedQuotes', savedQuotes);
    //print("Saved Quotes: $savedQuotes");
  }

  Future<void> _updateQuoteOnceADay() async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetchedTime = prefs.getInt('lastFetchedTime');
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if (lastFetchedTime == null || currentTime - lastFetchedTime > 24 * 60 * 60 * 1000) {
      final response = await http.get(Uri.parse('https://api.adviceslip.com/advice'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _Textcontroller = data['slip']['advice'];
        });
        await prefs.setInt('lastFetchedTime', currentTime);
        await prefs.setString('lastFetchedQuote', _Textcontroller);
      } else {
        setState(() {
          _Textcontroller = 'Failed to load a quote';
        });
      }
    } else {
      final lastFetchedQuote = prefs.getString('lastFetchedQuote') ?? 'No quote available';
      setState(() {
        _Textcontroller = lastFetchedQuote;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  "Quote of the Day",
                  style: TextStyle(
                    color: const Color(0xff4a5a66),
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                padding: EdgeInsets.fromLTRB(12.w, 40.h, 12.w, 15.h),
                child: Text(
                  _Textcontroller,
                  style: TextStyle(
                    color: const Color(0xff8a8a8a),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 150,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _saveQuote(); // Save the quote
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Quote saved to Favorites')),
                      );
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  child: TextButton(
                    onPressed: sharePressed,
                    child: Text(
                      "Share",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
    String message = _Textcontroller;
    Share.share(message);
  }
}
