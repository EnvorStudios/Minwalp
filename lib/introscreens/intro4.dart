// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xwalli/constants.dart';
import 'package:xwalli/main.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RealWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/refresh.json'),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              "Refresh your wallpapers once in a while, using the Refresh wallpapers option, in settings",
              textAlign: TextAlign.center,
              style: TextStyle(color: Black, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
