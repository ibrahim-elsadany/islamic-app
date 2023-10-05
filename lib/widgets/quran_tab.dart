import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/model.dart';
import 'package:islami/screens/quran_screen.dart';
import 'package:provider/provider.dart';
import '../provider_controller.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);

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
              "images/qur2an_screen_logo.png",
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: double.infinity,
                    width: 3,
                    color: appProvider.isDarkModeEnabled
                        ? AppColors.darkCounterContainerColor
                        : AppColors.primaryColor,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 3,
                      color: appProvider.isDarkModeEnabled
                          ? AppColors.darkCounterContainerColor
                          : AppColors.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            appProvider.textLanguage("soura name"),
                            style: TextStyle(
                                fontSize: 20,
                                color: appProvider.isDarkModeEnabled
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: "font3",
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            appProvider.textLanguage("adad ayat"),
                            style: TextStyle(
                                fontSize: 20,
                                color: appProvider.isDarkModeEnabled
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: "font3",
                                fontWeight: FontWeight.bold),
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
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: AppModel.souraName.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(QuranScreen.routeName, arguments: {
                                "soura_name": AppModel.souraName[index],
                                "soura_details": "${index + 1}.txt"
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppModel.souraName[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: appProvider.isDarkModeEnabled
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "font2"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      AppModel.numberOfVerses[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: appProvider.isDarkModeEnabled
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "font2"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
