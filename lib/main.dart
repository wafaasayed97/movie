import 'package:flutter/material.dart';

import 'core/services/services_locator.dart';
import 'movies/presentation/screens/movies_screen.dart';
void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
      home: const MoviesScreen(),
    );
  }
}