import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/provider_controller.dart';
import 'package:islami/screens/hadeth_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/quran_screen.dart';
import 'package:islami/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
        routes: {
          QuranScreen.routeName: (_) => const QuranScreen(),
          HomeScreen.routeName: (_) => const HomeScreen(),
          HadethScreen.routeName: (_) => const HadethScreen(),
        },
      ),
    );
  }
}

