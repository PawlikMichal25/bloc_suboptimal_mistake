import 'package:bloc_suboptimal_mistake/home/presentation/home_page_optimized.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Make it optimal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageOptimized(),
    );
  }
}
