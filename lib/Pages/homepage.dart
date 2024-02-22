import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xwalli/constants.dart';

import 'package:xwalli/wallpapers/displaywalls.dart';

import '../wallpapers/fullimage.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Assume FullScreen widget is defined similarly as before

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> trendingImages = [
    'https://source.unsplash.com/random/1920x1080/?nature',
    'https://source.unsplash.com/random/1920x1080/?mountain',
    'https://source.unsplash.com/random/1920x1080/?city',
    'https://source.unsplash.com/random/1920x1080/?travel',
    'https://source.unsplash.com/random/1920x1080/?architecture',
    'https://source.unsplash.com/random/1920x1080/?animal',
    'https://source.unsplash.com/random/1920x1080/?aesthetic',
    'https://source.unsplash.com/random/1920x1080/?minimal',
    // Add more trending image URLs as needed
    // Initial list of trending image URLs fetched from Unsplash
    // ...
  ];

  // Simulated function to fetch new images (replace with your logic)
  List<String> fetchNewImages() {
    // Logic to fetch new images from Unsplash or any other source
    // For demonstration, returning a hardcoded list of new images
    return [
      'https://source.unsplash.com/random/1920x1080/?nature',
      'https://source.unsplash.com/random/1920x1080/?mountain',
      'https://source.unsplash.com/random/1920x1080/?city',
      'https://source.unsplash.com/random/1920x1080/?travel',
      'https://source.unsplash.com/random/1920x1080/?architecture',
      'https://source.unsplash.com/random/1920x1080/?animal',
      'https://source.unsplash.com/random/1920x1080/?aesthetic',
      'https://source.unsplash.com/random/1920x1080/?minimal',
      // Add more trending image URLs as needed
      // Add more URLs as needed...
    ];
  }

  // Function to periodically update trending images
  void updateTrendingImages() {
    List<String> newImages = fetchNewImages(); // Fetch new images

    setState(() {
      trendingImages = newImages;
    });
  }

  @override
  void initState() {
    super.initState();
    // Start a timer to refresh images every 10 seconds
    Timer.periodic(Duration(seconds: 10), (Timer t) => updateTrendingImages());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    return ListView(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: height / 3.5,
            ),
            ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ).createShader(const Rect.fromLTRB(0, 0, 0, 200));
                },
                blendMode: BlendMode.dstIn,
                child: CachedNetworkImage(
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            const Text(
                              "No Internet",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      );
                    },
                    imageUrl:
                        'https://source.unsplash.com/random/1920x1080?aesthetic')),
            Positioned(
                bottom: 0,
                left: width / 20,
                child: Text(
                  "MinWalp",
                  style: TextStyle(
                      fontSize: size.height / 18, color: Black),
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.all(width / 30),
          child: Text(
            "The ultimate backdrop for any mood!",
            style: TextStyle(fontSize: size.height / 50, color: UnderLine),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 20),
          child: Text(
            "New Release",
            style: TextStyle(fontSize: size.height / 40, color: Black),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: height / 4.5,
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          items: trendingImages.map((imageUrl) {
            return GestureDetector(
              onTap: () {
                // Navigate to full-screen view on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreen(
                      // Pass necessary parameters to FullScreen widget
                      index: trendingImages.indexOf(imageUrl),
                      type: 'Trending', // Provide a type or category
                      url: imageUrl,
                    ),
                  ),
                );
              },
              child: Container(
                // Carousel item UI...
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(imageUrl),
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        Padding(
          padding: EdgeInsets.all(width / 20),
          child: Text(
            "Highlighted",
            style: TextStyle(fontSize: size.height / 40, color: Black),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 30),
          child: InkWell(
            borderRadius: BorderRadius.circular(7),
            splashColor: Mint,
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "Nature",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              height: height / 7,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: width,
                    placeholder: (context, url) {
                      return const Center(
                        child: CupertinoActivityIndicator(
                          color: UnderLine,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                    imageUrl:
                        'https://source.unsplash.com/random/1920x1080?forest',
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            const Text(
                              "No Internet",
                              style: TextStyle(color: Camel),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    right: width / 40,
                    bottom: height / 60,
                    child: Text(
                      "Nature",
                      style: TextStyle(
                          fontSize: size.height / 35, color: RealWhite),
                    )),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: InkWell(
            borderRadius: BorderRadius.circular(7),
            splashColor: Mint,
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "night skies",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              height: height / 7,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: width,
                    placeholder: (context, url) {
                      return const Center(
                        child: CupertinoActivityIndicator(
                          color: UnderLine,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                    imageUrl:
                        'https://source.unsplash.com/random/1920x1080?nightsky',
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            const Text(
                              "No Internet",
                              style: TextStyle(color: Camel),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    right: width / 20,
                    bottom: height / 50,
                    child: Text(
                      "Night Skies",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Camel),
                    )),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: InkWell(
            borderRadius: BorderRadius.circular(7),
            splashColor: Mint,
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "Dark",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              height: height / 7,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: width,
                    placeholder: (context, url) {
                      return const Center(
                        child: CupertinoActivityIndicator(
                          color: UnderLine,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                    imageUrl:
                        'https://source.unsplash.com/random/1920x1080?dark',
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            const Text(
                              "No Internet",
                              style: TextStyle(color: Camel),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    right: width / 40,
                    bottom: height / 60,
                    child: Text(
                      "Dark",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Camel),
                    )),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: InkWell(
            borderRadius: BorderRadius.circular(7),
            splashColor: Mint,
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "City Line",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              height: height / 7,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: width,
                    placeholder: (context, url) {
                      return const Center(
                        child: CupertinoActivityIndicator(
                          color: UnderLine,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                    imageUrl:
                        'https://source.unsplash.com/random/1920x1080?sunset+city',
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            const Text(
                              "No Internet",
                              style: TextStyle(color: Camel),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    right: width / 20,
                    bottom: height / 50,
                    child: Text(
                      "City Lines",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Camel),
                    )),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: InkWell(
            borderRadius: BorderRadius.circular(7),
            splashColor: Mint,
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "purple",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              height: height / 7,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: width,
                    placeholder: (context, url) {
                      return const Center(
                        child: CupertinoActivityIndicator(
                          color: UnderLine,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                    imageUrl:
                        'https://source.unsplash.com/random/1920x1080?purple',
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            const Text(
                              "No Internet",
                              style: TextStyle(color: Black),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    right: width / 20,
                    bottom: height / 50,
                    child: Text(
                      "Purple",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Camel),
                    )),
              ]),
            ),
          ),
        ),
      ],
    );
  }

}
