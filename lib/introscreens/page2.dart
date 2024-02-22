import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RealWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/search.json'),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "Search for your desired wallpapers on the Explore page",
              textAlign: TextAlign.center,
              style: TextStyle(color: Black, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
