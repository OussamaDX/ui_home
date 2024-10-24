import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'styles/app_colors.dart';
void main()
{
  runApp(my_App());
}

class my_App extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.background,
      ),
    initialRoute: '/',
    routes: 
    {
     '/': (context) => LoginPage(),
     '/home': (context) => HomePage(),  
    },
  );
  }
}
// add walapeper to this 

//materail vs scaffold
//color box