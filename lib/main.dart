import 'package:flutter/material.dart';
import 'package:hotel_app/core/navigation/main_navigation.dart';



void main() {
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: MainNavigation.initialRoute,    
      routes: MainNavigation.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),      
      
    );
  }
}

