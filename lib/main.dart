import 'package:flutter/material.dart';
import 'features/app_view/screens/Home/home.dart';
import 'features/app_view/screens/landingPage/landingPage.dart';
import 'features/app_view/screens/news_detail/news_detail.dart';
import 'features/app_view/screens/search_screen/search_screen.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter",
        home: SplashScreen(),
    );
  }
}

