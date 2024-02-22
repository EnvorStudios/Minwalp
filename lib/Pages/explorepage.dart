import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:xwalli/constants.dart';
import 'package:xwalli/wallpapers/displaywalls.dart';

import '../wallpapers/fullimage.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<String> newImages = [

    'https://source.unsplash.com/random/1920x1080/?nature',
    'https://source.unsplash.com/random/1920x1080/?mountain',
    'https://source.unsplash.com/random/1920x1080/?city',
    'https://source.unsplash.com/random/1920x1080/?travel',
    'https://source.unsplash.com/random/1920x1080/?architecture',
    'https://source.unsplash.com/random/1920x1080/?animal',
    'https://source.unsplash.com/random/1920x1080/?aesthetic',
    'https://source.unsplash.com/random/1920x1080/?minimal',
    // Add more trending image URLs as needed
    // Initial list of trending image URLs fetched from Unsplash or any source...
    // ...
  ];

  // Simulated function to fetch new images
  List<String> fetchNewImages() {
    // Logic to fetch new images from Unsplash or any source
    // Replace this with your logic to fetch new images
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
  void updateImages() {
    // Simulated function to fetch new image URLs
    List<String> fetchedImages = fetchNewImages(); // Your method to fetch new images

    setState(() {
      newImages = fetchedImages;
    });
  }

  @override
  void initState() {
    super.initState();
    // Start a timer to refresh images every 30 seconds
    Timer.periodic(Duration(seconds: 10), (Timer t) => updateImages());
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 5, vertical: width / 10),
          child: Text(
            'Fresh Assortment',
            style: TextStyle(color: Black, fontSize: 25),
          ),
        ),
        // Replace search section with trending wallpapers carousel
        CarouselSlider(
          options: CarouselOptions(
            height: height / 4.5,
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          items: newImages.map((imageUrl) {
            return GestureDetector(
              onTap: () {
                // Navigate to full-screen view on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreen(
                      // Pass necessary parameters to FullScreen widget
                      index: newImages.indexOf(imageUrl),
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
        SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 20, vertical: width / 20),
                child: const Text("Recommended Sections",
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
