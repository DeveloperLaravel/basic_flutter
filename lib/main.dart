import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_new/core/theme/app_colors.dart';
import 'package:home_new/name/name_bloc.dart';
import 'package:home_new/name_bloc_page.dart';

import 'core/theme/app_theme.dart';
import 'name_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;
  void changeTheme(){
    setState(() {
      isDark =! isDark;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: isDark
      ?  ThemeMode.light : 
         ThemeMode.dark,
      home: 
      
        MyHomePage(press: changeTheme, isDark: isDark,),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.press, required this.isDark});
  final VoidCallback press;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('الاسماء',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
        actions: [
          IconButton(onPressed: press, icon: Icon(
            isDark ?
            Icons.dark_mode 
            :  Icons.light_mode ,
            ))
        ],
      ),
      body: 
      BlocProvider(create: (_)=>NameBloc(),
      child: const NameBlocPage(),)
      
// const  NamePage(),
        
   
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "assets/images/1.png",
    "title": "All your favorites",
    "text":
        "Order from the best local restaurants \nwith easy, on-demand delivery.",
  },
  {
    "illustration": "assets/images/2.png",
    "title": "Free delivery offers",
    "text":
        "Free delivery for new customers via Apple Pay\nand others payment methods.",
  },
  {
    "illustration": "assets/images/3.png",
    "title": "Choose your food",
    "text":
        "Easily find your type of food craving and\nyou’ll get delivery in wide range.",
  },
    {
    "illustration": "assets/images/4.png",
    "title": "Choose your food",
    "text":
        "Easily find your type of food craving and\nyou’ll get delivery in wide range.",
  },
];
List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/1.png",
      "assets/images/2.png",
      "assets/images/3.png",
      "assets/images/4.png"
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: 'description',
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "https://i.postimg.cc/CxD6nH74/Image-Popular-Product-2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: 'description',
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "https://i.postimg.cc/1XjYwvbv/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: 'description',
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "https://i.postimg.cc/d1QWXMYW/Image-Popular-Product-3.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: 'description',
    rating: 4.1,
    isFavourite: false,
    isPopular: true,
  ),
];
class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}