import 'package:flutter/material.dart';
import 'package:islami/screens/hadeth_screen.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../provider_controller.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              "images/hadeth_logo.png",
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Container(
                  height: 3,
                  color: appProvider.isDarkModeEnabled
                      ? AppColors.darkCounterContainerColor
                      : AppColors.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        appProvider.textLanguage("Al-Ahadeth"),
                        style: TextStyle(
                            fontSize: 20,
                            color: appProvider.isDarkModeEnabled
                                ? Colors.white
                                : Colors.black,
                            fontFamily: "font3"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  color: appProvider.isDarkModeEnabled
                      ? AppColors.darkCounterContainerColor
                      : AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            HadethScreen.routeName,
                            arguments: "${index + 1}.txt",
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                " ${appProvider.textLanguage("Hadeth number")}  ${index + 1}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: appProvider.isDarkModeEnabled
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "font3"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
