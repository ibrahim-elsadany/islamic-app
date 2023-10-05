import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/widgets/settings_tab.dart';
import 'package:provider/provider.dart';

import '../provider_controller.dart';
import '../widgets/hadeth_tab.dart';
import '../widgets/quran_tab.dart';
import '../widgets/radio_tab.dart';
import '../widgets/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;


List<Widget> appTabs = [
  const RadioTab(),
  const SebhaTab(),
  const HadethTab(),
  const QuranTab(),
  const SettingTab(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider themeProvider = Provider.of<AppProvider>(context);

    List<BottomNavigationBarItem> bottomNavBar = [
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage("images/icon_radio.png"),
        ),
        label: themeProvider.textLanguage("radio"),
      ),
      BottomNavigationBarItem(
        icon:const ImageIcon(AssetImage("images/icon_sebha.png")),
        label: themeProvider.textLanguage("sepha"),
      ),
      BottomNavigationBarItem(
          icon:const ImageIcon(AssetImage("images/icon_hadeth.png")), label: themeProvider.textLanguage("ahadeth")),
      BottomNavigationBarItem(
          icon:const ImageIcon(AssetImage("images/icon_quran.png")), label: themeProvider.textLanguage("quran")),
      BottomNavigationBarItem(icon: const Icon(Icons.settings), label: themeProvider.textLanguage("settings"))
    ];
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
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
            ),
            appTabs[currentIndex],
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: themeProvider.isDarkModeEnabled
                ? AppColors.darkPrimaryColor
                : AppColors.primaryColor,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: themeProvider.isDarkModeEnabled
                  ? AppColors.darkCounterContainerColor
                  : Colors.black,
              unselectedItemColor: Colors.white,
            ),
          ),
          child: BottomNavigationBar(
            iconSize: 30,
            currentIndex: currentIndex,
            onTap: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            items: bottomNavBar,
          ),
        ),
      ),
    );
  }
}
