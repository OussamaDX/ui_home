import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/styles/app_colors.dart';
//explain the app bar witdget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 1,
        title: Text('5minuteflutter',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),),
        actions: [
          Icon(Icons.location_on_outlined), 
        ],
        centerTitle: false,
      
      ),
      body: ListView(
        children: helper_server(),
      ),
    );
  }
    Widget Item_users()
    {
      return 
          Row(
          children: [
            Image.asset('assets/temps/test1.jpg',height: 40,width: 40,),
            SizedBox(width: 16,),
            Text('oussama oussaada'),
          ],
        );
    }
    List<Widget> helper_server()
    {
      List<Widget> helper = [];
      for (var i = 0; i < 200; i++)
      {
        helper.add(Item_users());  
      }
      return helper;
    }
}