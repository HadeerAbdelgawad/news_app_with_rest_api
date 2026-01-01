import 'package:flutter/material.dart';

import '../Home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(
        Duration(seconds: 5))
        .then((value){
      if(mounted){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=> HomeScreen(),)
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff001F3F),

      body:
      Padding(
        padding: const EdgeInsets.only(top: 350),
        child:
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height:170),
            Image.asset('assets/images/INSIGHT 360.png')


          ],
        ),
      ),
    );
  }
}
