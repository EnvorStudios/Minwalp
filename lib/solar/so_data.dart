import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xwalli/constants.dart';

class DoctorsInfo extends StatefulWidget {
  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RealWhite,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(), // Use BouncingScrollPhysics here
        slivers: <Widget>[
          SliverAppBar(
            title: Text('A B O U T  U S'),
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
                  height: 100,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'E N V O R  S T U D I O S',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          //Text('',
                          //  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        //  ),
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
                  height: 200,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         // Text(
                        //    '🐛Release Notes - Known Bugs:',
                        //    textAlign: TextAlign.center,
                        //    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                       //   ),
                          SizedBox(height: 10),
                          Text(
                            'At Envor Studios, we are more than just developers; we are dream weavers and tech aficionados! 🌟 Our passion lies in crafting captivating digital experiences that resonate with innovation and creativity.',
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
                  height: 200,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Text(
                          //    '🐛Release Notes - Known Bugs:',
                          //    textAlign: TextAlign.center,
                          //    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          //   ),
                          SizedBox(height: 10),
                          Text(
                            '👨‍💻 With each line of code and every pixel crafted, we aim to redefine user interaction and elevate UI experiences. Our team thrives on the challenge of transforming visionary ideas into seamless and engaging applications.',
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
                  height: 200,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Text(
                          //    '🐛Release Notes - Known Bugs:',
                          //    textAlign: TextAlign.center,
                          //    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          //   ),
                          SizedBox(height: 10),
                          Text(
                            '🤝 Collaboratively, we orchestrate a symphony of diverse talents and perspectives, ensuring every app we create is a masterpiece. Our dedication is to provide not just apps, but an adventure in user interface excellence.',
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
                  height: 200,
                  color: Mint,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Text(
                          //    '🐛Release Notes - Known Bugs:',
                          //    textAlign: TextAlign.center,
                          //    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          //   ),
                          SizedBox(height: 10),
                          Text(
                            '💡 Innovation fuels our journey, and user satisfaction is our compass. We are on a relentless pursuit to deliver apps that not only meet expectations but exceed them. Join us on this quest for the extraordinary!',
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
