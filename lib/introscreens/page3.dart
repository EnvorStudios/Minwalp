import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xwalli/constants.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RealWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/avoidsearch.json'),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "Avoid searching for plurals , as they might not give very relevant results",
              textAlign: TextAlign.center,
              style: TextStyle(color: Black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
