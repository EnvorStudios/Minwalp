import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:xwalli/constants.dart';

class BugsPage extends StatefulWidget {
  @override
  _BugsPageState createState() => _BugsPageState();
}

class _BugsPageState extends State<BugsPage> {
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
        physics: BouncingScrollPhysics(), // Use BouncingScrollPhysics here
        slivers: <Widget>[
          SliverAppBar(
            title: Text('A N O M A L I E S  L O G'),
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 750,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '🐛Release Notes - Known Bugs:',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '🔙 Back Button Issue in App Bar:\n'
                                'Description: Clicking the back button in the app bar does not navigate backward.\n'
                                'Status: Pending resolution.\n'
                                'Impact: Users may experience navigation difficulties within the app.\n'
                                'Impact: Users may experience navigation difficulties within the app.\n\n\n'
                                '🌀 Stuck on Splash Screen:\n'
                                'Description: Users are unable to proceed past the splash screen after clicking the back button.\n'
                                'Status: Pending resolution.\n'
                                'Impact: Users cannot access the apps main functionality, leading to a poor user experience.\n\n'
                                '👩‍💻 Developers are actively investigating these issues and working towards a solution in the upcoming release. 🚀',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16,),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
