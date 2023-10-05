import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("images/radio_image.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    size: 70,
                    color: AppColors.primaryColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    size: 70,
                    color: AppColors.primaryColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    size: 70,
                    color: AppColors.primaryColor,
                  )),
             // SizedBox(width: 0.2,)
            ],
          )
        ],
      ),
    );
  }
}
