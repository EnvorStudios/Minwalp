import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xwalli/Pages/home.dart';
import 'package:xwalli/constants.dart';
import 'package:xwalli/introscreens/intro4.dart';
import 'package:xwalli/introscreens/intro5.dart';
import 'package:xwalli/introscreens/page1.dart';
import 'package:xwalli/introscreens/page2.dart';
import 'package:xwalli/introscreens/page3.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController controller = PageController(initialPage: 0);

  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: ((value) {
            setState(() {
              lastPage = (value == 4);
            });
          }),
          controller: controller,
          children: const [Page1(), Page2(), Page3(), Page4(), Page5()],
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                  child: const Text(
                    "Previous",
                    style: TextStyle(color: Black),
                  ),
                  onPressed: () {
                    controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }),
              SmoothPageIndicator(controller: controller, count: 5, effect: const SlideEffect(
                activeDotColor: Camel,
                dotHeight: 10,
                dotColor: Mint,
                dotWidth: 10,
              ),),
              !lastPage
                  ? CupertinoButton(
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Black),
                      ),
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      })
                  : CupertinoButton(
                      child: const Text(
                        "Done",
                        style: TextStyle(color: Black),
                      ),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('showHome', true);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Home())));
                      }),
            ],
          ),
        )
      ],
    ));
  }
}
