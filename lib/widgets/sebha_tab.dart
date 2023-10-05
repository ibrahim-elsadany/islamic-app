import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../provider_controller.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Center(
                    child: Image.asset(
                      appProvider.isDarkModeEnabled
                          ? "images/head_sebha_dark.png"
                          : "images/head_sebha_logo.png",
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 77),
                  child: Center(
                    child: Transform.rotate(
                      angle:
                          appProvider.rotationAngle * (3.14159265359 / 180),
                      child: Image.asset(
                        appProvider.isDarkModeEnabled
                            ? "images/body_sebha_dark.png"
                            : "images/body_sebha_logo.png",
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            const Text(
              "عدد التسبيحات",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "font3"),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 70,
              width: 60,
              decoration: BoxDecoration(
                color: appProvider.isDarkModeEnabled
                    ? AppColors.darkPrimaryColor
                    : AppColors.counterContainerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                "${appProvider.sebhaCounter}",
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    appProvider.sebhaAnimatin();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => appProvider.isDarkModeEnabled
                              ? AppColors.darkCounterContainerColor
                              : AppColors.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "سبحان الله",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "font3",
                          color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    appProvider.sebhaCounterToZero();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => appProvider.isDarkModeEnabled
                              ? AppColors.darkCounterContainerColor
                              : AppColors.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "من الأول",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "font3",
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
