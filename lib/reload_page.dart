import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReloadPage extends StatefulWidget {
  const ReloadPage({super.key});

  @override
  State<ReloadPage> createState() => _ReloadPageState();
}

class _ReloadPageState extends State<ReloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
