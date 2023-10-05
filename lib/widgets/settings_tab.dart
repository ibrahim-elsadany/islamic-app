import 'package:flutter/material.dart';
import 'package:islami/provider_controller.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: h * 0.15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                appProvider.textLanguage("Change Theme"),
                style: TextStyle(
                    fontFamily: "font2",
                    color: appProvider.isDarkModeEnabled
                        ? Colors.white
                        : Colors.black,
                    fontSize: 25),
              ),
              Switch(
                activeColor: Colors.indigo,
                value: appProvider.isDarkModeEnabled,
                onChanged: (value) {
                  appProvider.toggleTheme();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                appProvider.textLanguage("Change Language"),
                style: TextStyle(
                    fontFamily: "font2",
                    color: appProvider.isDarkModeEnabled
                        ? Colors.white
                        : Colors.black,
                    fontSize: 25),
              ),
              Switch(
                activeColor: Colors.indigo,
                value: appProvider.isArabicEnabeld,
                onChanged: (value) {
                  appProvider.toggleLanguage();
                  appProvider.changeLanguage();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
