import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
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
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(12.w, 15.h, 12.w, 15.h),
                child: SingleChildScrollView(
                  child: Text("the quotes are visible after completion of designs,the quotes are visible after completion of designs,"
                      "the quotes are visible after completion of designs,the quotes are visible after completion of designs,"
                      "the quotes are visible after completion of designs,the quotes are visible after completion of designs,"
                      "the quotes are visible after completion of designs,the quotes are visible after completion of designsthe quotes are visible after completion of designs,the quotes are visible after completion of designs,"
                      "the quotes are visible after completion of designs,the quotes are visible after completion of designs,"
                      "the quotes are visible after completion of designs,the quotes are visible after completion of designs,"
                      "the quotes are visible after completion of designs,the quotes are visible after completion of designs",
                    style: TextStyle(color: const Color(0xff8a8a8a),fontSize: 20.sp,fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    maxLines: 150,
                  ),
                ),
              ),
            ),
             SizedBox(height: 15.h,),
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
                  child: TextButton(onPressed: (){}, child:Text("Save",
                    style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                ),
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
                  child: TextButton(onPressed: (){}, child: Text("Share",
                    style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                ),

              ],
            )
          ],
        ),
      ),

    );
  }
}
