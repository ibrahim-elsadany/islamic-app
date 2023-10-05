import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_controller.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    AppProvider themeProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              //حل مشكلة ال سبلاش سكرين في وضع الدارك
              "images/splash@3x.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
