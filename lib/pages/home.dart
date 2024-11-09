import 'package:flutter/material.dart';
import 'package:flutter_application_1_beginner/models/category_models.dart';
import 'package:flutter_svg/svg.dart';
import '../models/popular_model.dart';
import '../models/diet_model.dart';

class Home_ extends StatelessWidget {
  Home_({super.key});

  List<CategoryModel> categories = [];
  List<PopularDietsModel> popularDiets = [];
  List<DietModel> diets = [];


  void get_information()
  {
    diets = DietModel.getDiets();
    categories = CategoryModel.getCategories();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  
  
  Widget build(BuildContext context) {
    get_information();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: 
        Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            _SearchField,
            SizedBox(height: 40,),
            category_section(),
            SizedBox(height: 40,),
            _diet_methode(),
            SizedBox(height: 40,),
            popular_model(),
            SizedBox(height: 30,),
          ],
             ),
      ),
    );
  }

  Column popular_model() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Popular',
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              ListView.separated(
                itemCount: popularDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 25,),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          popularDiets[index].iconPath,
                          width: 65,
                          height: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                            Text(
                              popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calorie,
                              style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: popularDiets[index].boxIsSelected ?
                       Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: popularDiets[index].boxIsSelected ? [
                        BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0
                        )
                      ] : []
                    ),
                  );
                },
              )
            ],
          );
  }

  Column _diet_methode() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left:20),
            child: Text(
              'Recommendation\nfor Diet',
                style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            height: 240,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Column(
                        children: [
                          Text(
                            diets[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                          Text(
                            diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie,
                            style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              diets[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                              diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                            ]
                          ),
                          borderRadius: BorderRadius.circular(50)
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 25,),
              itemCount: diets.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
              left: 20,
              right: 20
            ),
            ),
          )
        ],
      );
  }

  Column category_section() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              ),
            ),
            SizedBox(height: 18,),
            Container(
              height: 100,
              // color: Colors.green,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemCount: categories.length,
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder:(context, index)
                {
                 return Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                           shape: BoxShape.circle,
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                      ),
                      Text(categories[index].name,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    ),
                 );
                },
              ),
            ),
          ],
        );
  }

Container get _SearchField {
  return Container(
    margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 40,
          spreadRadius: 0.1,
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        hintText: 'Search for Cake',
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 92, 87, 87),
          fontSize: 11,
        ),
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset('assets/icons/Search.svg'),
        ),
        suffixIcon: Container(
          width: 100,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalDivider(
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Filter.svg'),
                ),
              ],
            ),
          ),
        ),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

  AppBar appBar() {
    return AppBar(
      title: Text('BreaKfast',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      ),
      leading: GestureDetector(
        onTap: () {
        },
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center, // ask why dosent change even i add the parametre of the width and height
          child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
          height: 20,
          width: 20,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 225, 214, 214),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (){

          },
          child: Container(
          margin: EdgeInsets.all(10),
          width: 37,
          alignment: Alignment.center, // ask why dosent change even i add the parametre of the width and height
          child: SvgPicture.asset('assets/icons/dots.svg',
          height: 5,
          width: 5,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 225, 214, 214),
            borderRadius: BorderRadius.circular(10),
          ),
                  ),
        ),
      ],
    );
  }
}