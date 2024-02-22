import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:xwalli/constants.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _version = 'Unknown';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RealWhite,
      body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
      SliverAppBar(
      title: Text('R E L E A S E  N O T E S'),
      backgroundColor: Mint,
      pinned: true,
      expandedHeight: 300.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
          bottomRight: Radius.circular(20.0),
        ),
      ),
    ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 200,
                  color: Mint,
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text(
                        'Release Iteration',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _version,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
    ]),
                ),
              ),
            ),
          ),
          ),SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 350,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Our 4.0.0 series, often referred to as the "Zenith," represents the pinnacle of our development efforts. 🌟 This iteration symbolizes the culmination of meticulous enhancements and advancements, embodying our commitment to excellence. 🚀',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 10),
                          //Text(
                          //  '4.0.0',
                        //    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                       //   ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 550,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Revision History',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '🌟 Enhancements:\nHeader Name Improvements 📝✨\nEnhanced the clarity and consistency of heading names throughout the app.\n'
                                'Improved Navigation Bar Animations 🚀🎉\nImplemented smoother and more fluid animations for the navigation bar.\n'
                                'Revamped Navigation Bar Icons 🖼️🔄/nUpdated navigation bar icons for a more intuitive and modern look.\nBug Fixes and Performance Enhancements 🛠️🚀\n'
                                'Resolved various minor bugs to ensure a seamless user experience.\nImproved overall app performance for better responsiveness.\n \n4.2.0',
                            textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16,),
                             ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 650,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New Update Chronicles\n 4.3.0',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '📝 Version Page Update!\n'
                                '🎉 We have jazzed up our app with a sparkling new "About Version" section! Here is whats fresh/n'
                                '🔍 Track Past Changes: Now easily scan through the history of our updates to relive the evolution of your favorite app!\n'
                                '📈 Stay Updated: Stay in the loop with the latest improvements, bug fixes, and features added to keep your experience top-notch!\n'
                                '📚 A History Book for Your App: Dive into the chronicles of our apps journey, right from its inception to the present-day version! 🚀\n'
                                '🔧 Bug Squashing and Enhancements: We have also fine-tuned things under the hood to ensure smoother sailing.\n'
                                '👀 Keep an eye on the "About Version" page for all the exciting updates and improvements! Enjoy exploring!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16,),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          )],
      ),
    );
  }
}



