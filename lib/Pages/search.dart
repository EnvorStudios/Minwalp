import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xwalli/constants.dart';
import 'package:xwalli/wallpapers/displaywalls.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List images = [
      'https://images.unsplash.com/photo-1558865869-c93f6f8482af?q=80&w=1781&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1495476479092-6ece1898a101?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1542273917363-3b1817f69a2d?q=80&w=1774&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1682124752476-40db22034a58?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ];

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 10),
                        child: Row(
                          children: const [
                            Text(
                              "Seek",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Mint,
                                  fontSize: 25),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 10, vertical: 10),
                          child: CupertinoSearchTextField(
                            autofocus: false,
                            style: const TextStyle(color: Camel),
                            controller: controller,
                            onSubmitted: (value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          Wallpapers(type: controller.text))));
                            },
                            placeholder: "Scour for wallpapers",
                            placeholderStyle:
                            const TextStyle(color: Mint),
                            itemColor: Camel,
                            padding: const EdgeInsets.all(10),
                            backgroundColor: RealWhite,
                          )),
                    ],
                  ))
            ]),
          ),
        ),
        SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 20, vertical: width / 20),
                child: const Text("Proposed Divisions",
                    style: TextStyle(color: Black, fontSize: 20)),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Mint,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "sunset"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: SizedBox(
                            width: width / 2.3,
                            height: height / 9.5,
                            child: Stack(children: [
                              Image(
                                  width: width,
                                  fit: BoxFit.cover,
                                  image: const CachedNetworkImageProvider(
                                      "https://source.unsplash.com/random/1920x1080/?sunset")),
                              Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      Text("Sunsets",
                                          style: TextStyle(
                                              color: Camel,
                                              fontSize: 20)),
                                      Text("the drowning sun?",
                                          style: TextStyle(
                                              color: Camel,
                                              fontSize: 15)),
                                    ],
                                  ))
                            ]),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Mint,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "roadside"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?roadside")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Roadside",
                                            style: TextStyle(
                                                color: Camel,
                                                fontSize: 20)),
                                        Text("For the long drives",
                                            style: TextStyle(
                                                color: Mint,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Mint,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "Japan"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?japan")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Anime",
                                            style: TextStyle(
                                                color: Camel,
                                                fontSize: 20)),
                                        Text("Some anime stuff?",
                                            style: TextStyle(
                                                color: Mint,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Mint,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "Forest"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?forest")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Woods",
                                            style: TextStyle(
                                                color: Camel,
                                                fontSize: 20)),
                                        Text("The Nature!",
                                            style: TextStyle(
                                                color: Mint,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Mint,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "minimal"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?minimalistic")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Minimal",
                                            style: TextStyle(
                                                color: Camel,
                                                fontSize: 20)),
                                        Text("minimalistic stuff",
                                            style: TextStyle(
                                                color: Mint,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Mint,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "aesthetic"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?aesthetic")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Aesthetic ",
                                            style: TextStyle(
                                                color: Camel,
                                                fontSize: 20)),
                                        Text("The Nature!",
                                            style: TextStyle(
                                                color: Mint,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Mint,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "night"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?night")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Night Life",
                                            style: TextStyle(
                                                color: Camel,
                                                fontSize: 20)),
                                        Text("sleepy nights",
                                            style: TextStyle(
                                                color: Mint,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Mint,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "festivals"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?festival")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Festivals",
                                            style: TextStyle(
                                                color: Camel,
                                                fontSize: 20)),
                                        Text("The festivities",
                                            style: TextStyle(
                                                color: Mint,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}