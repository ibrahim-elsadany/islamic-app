import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islami/provider_controller.dart';
import 'package:provider/provider.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);
  static String routeName = "quran_screen";

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  String souraContent = "";
  List<String> versus = [];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    AppProvider themeProvider = Provider.of<AppProvider>(context);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    double containerHeigh = h * 0.75;
    if (souraContent.isEmpty) loadTextFile(args["soura_details"]);

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
                height: containerHeigh,
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
                child: Column(children: [
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "سورة ${args["soura_name"]}",
                        style: TextStyle(
                            color: themeProvider.isDarkModeEnabled
                                ? AppColors.darkCounterContainerColor
                                : Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "font2"),
                      ),
                      Icon(
                        Icons.play_circle,
                        size: 45,
                        color: themeProvider.isDarkModeEnabled
                            ? AppColors.darkCounterContainerColor
                            : Colors.black,
                      ),
                    ],
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
                  versus.isEmpty? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CircularProgressIndicator()): SizedBox(
                    height: containerHeigh - containerHeigh * 0.2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: Soura(themeProvider),
                      ),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Text> Soura(AppProvider themeProvider) {
    return List.generate(versus.length, (index) {
      return Text(
        "${versus[index]}(${index + 1})",
        style: TextStyle(
          color: themeProvider.isDarkModeEnabled
              ? AppColors.darkCounterContainerColor
              : Colors.black,
          fontSize: 20,
          fontFamily: "font2",
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      );
    });
  }

  void loadTextFile(String txt) async {
    souraContent = await rootBundle.loadString('texts/${txt}');
    List<String> lines = souraContent.trim().split('\n');
    setState(() {
      versus = lines;
    });
  }
}
