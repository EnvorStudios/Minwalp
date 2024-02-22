import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:xwalli/Pages/about_version.dart';
import 'package:xwalli/Pages/known_bugs.dart';
import 'package:xwalli/constants.dart';
import 'package:xwalli/introscreens/intro.dart';
import 'package:xwalli/solar/so_data.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List images = [
      'https://images.unsplash.com/reserve/aOcWqRTfQ12uwr3wWevA_14401305508_804b300054_o.jpg?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1517315003714-a071486bd9ea?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1560972550-aba3456b5564?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1571757767119-68b8dbed8c97?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ];
    return ListView(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          child: Container(
            height: height / 3.7,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                  CachedNetworkImageProvider(images[Random().nextInt(4 - 0)]),
                )),
            child: Stack(children: [
              Positioned(
                bottom: height / 20,
                left: width / 30,
                child: const Text(
                  "Preferences",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Black,
                      fontSize: 30),
                ),
              ),
            ]),
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: (() {
              setState(() {
                DefaultCacheManager().emptyCache();
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    insetAnimationDuration: const Duration(seconds: 1),
                    title: const Text(" Wallpapers refreshed"),
                    content: const Text("Check out the updated wallpapers"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("done",
                              style: TextStyle(color: Mint)))
                    ],
                  ));
            }),
            splashColor: Mint,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Refresh Wallpapers",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Black,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "This will refersh the wallpapers",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: UnderLine,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              launchUrlString("mailto:envorstudios@gmail.com");
            },
            borderRadius: BorderRadius.circular(8),
            splashColor: Mint,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Contact Developer",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Black,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Any suggestions?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: UnderLine,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const Intro())));
            },
            borderRadius: BorderRadius.circular(8),
            splashColor: Mint,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Show intro Screen tips",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Black,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Incase you missed them ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: UnderLine,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => DoctorsInfo())));
            },
            borderRadius: BorderRadius.circular(8),
            splashColor: Mint,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "About Us",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Black,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Envor Studios ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: UnderLine,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => AboutPage())));
            },
            borderRadius: BorderRadius.circular(8),
            splashColor: Mint,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Version Info",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Black,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Release Information",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: UnderLine,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => BugsPage())));
            },
            borderRadius: BorderRadius.circular(8),
            splashColor: Mint,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Bugs Manifest",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Black,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Known Issues Catalog",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: UnderLine,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
