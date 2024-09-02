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
      backgroundColor: const Color(0xffeff4ff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.error,color: const Color(0xff4a5a66),size: 150.r,)),
          Center(child: Text("The quote will be updated daily.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: const Color(0xff4a5a66)),)),
        ],
      ),
    );
  }
}
