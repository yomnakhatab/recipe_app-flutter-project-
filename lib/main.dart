import 'package:flutter/material.dart';
import 'screens/recipe_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Culinary Haven',
      theme: ThemeData(
        primaryColor: Color(0xFF3D5A80),
        scaffoldBackgroundColor: Color(0xFFF5EFE6),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3D5A80),
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3D5A80),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF4A5568),
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF3D5A80),
          foregroundColor: Color(0xFFF5EFE6),
        ),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF3D5A80),
          secondary: Color(0xFF4A6FA5),
          surface: Color(0xFFF5EFE6),
        ),
      ),
      home: RecipeListScreen(),
    );
  }
}