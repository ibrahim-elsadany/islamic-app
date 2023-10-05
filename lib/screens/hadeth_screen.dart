import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import '../provider_controller.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({Key? key}) : super(key: key);
  static String routeName = "hadeth_screen";

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  String hadethContent = "";
  String firstLine = "";
  String hadethWithoutFirstLine = "";
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    AppProvider themeProvider = Provider.of<AppProvider>(context);
    final args = ModalRoute.of(context)!.settings.arguments as String;

    void loadTextFile() async {
      hadethContent = await rootBundle.loadString('hadeth/h$args');
      List<String> lines = hadethContent.trim().split("\n");
      setState(() {
        firstLine = lines[0];
        lines.removeAt(0);
        hadethWithoutFirstLine = lines.join();
      });
    }

    if (hadethContent.isEmpty) loadTextFile();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              themeProvider.isDarkModeEnabled
                  ? "images/dark_bg.png"
                  : "images/default_bg.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            IconButton(
                padding: const EdgeInsets.only(top: 13),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back,
                    size: 30,
                    color: themeProvider.isDarkModeEnabled
                        ? Colors.white
                        : Colors.black)),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  themeProvider.textLanguage("islami"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: "font2",
                      color: themeProvider.isDarkModeEnabled
                          ? Colors.white
                          : Colors.black),
                ),
              ]),
            ),
            Center(
              child: Container(
                height: h * 0.75,
                width: w * 0.85,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        themeProvider.isDarkModeEnabled
                            ? AppColors.darkPrimaryColor.withOpacity(0.2)
                            : Colors.white.withOpacity(0.2),
                        themeProvider.isDarkModeEnabled
                            ? AppColors.darkPrimaryColor
                            : Colors.white
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Text(
                        firstLine,
                        style: TextStyle(
                            color: themeProvider.isDarkModeEnabled
                                ? AppColors.darkCounterContainerColor
                                : Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "font2"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        height: 2,
                        color: themeProvider.isDarkModeEnabled
                            ? AppColors.darkCounterContainerColor
                            : AppColors.counterContainerColor,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          hadethWithoutFirstLine,
                          style: TextStyle(
                              color: themeProvider.isDarkModeEnabled
                                  ? AppColors.darkCounterContainerColor
                                  : Colors.black,
                              fontSize: 25,
                              fontFamily: "font1",
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
