import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favoritepage extends StatefulWidget {
  @override
  State<Favoritepage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<Favoritepage> {
  List<String> savedItems = [];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedItems = prefs.getStringList('savedQuotes') ?? [];
    });
    print("Saved Quotes: $savedItems");
  }


  void _removeItem(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedItems.removeAt(index);
      prefs.setStringList('savedQuotes', savedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff4ff),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Row(
              children: [
                Text(
                  "Favorites",
                  style: TextStyle(
                    color: Color(0xff4a5a66),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            for (int i = 0; i < savedItems.length; i++)
              Container(
                width: 275.w,
                height: 150.h,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 20.h),
                        child: Text(
                          savedItems[i],
                          style:  TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _removeItem(i);
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
