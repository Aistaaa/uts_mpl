import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui'; // Import this library

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_profile',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  // Define a function to handle launching URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('My Personal Information'),
        ),
        backgroundColor: Color.fromARGB(255, 99, 123, 146),
      ),
      backgroundColor: Colors.transparent, // Make Scaffold background transparent
      body: Stack( // Use Stack to overlay the background image with other content
        children: <Widget>[
          // Background Image with Blur Effect
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Path to your textured background image
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
              colorBlendMode: BlendMode.darken,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/profile_picture.jpeg'),
                      fit: BoxFit.contain,
                    ),
                    color: Color.fromARGB(255, 249, 250, 250),
                  ),
                ),
                SizedBox(height: 16.0),
                // Rest of your content...
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 99, 123, 146),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/github.png'),
              onPressed: () {
                _launchURL('https://github.com/Aistaaa');
              },
            ),
            IconButton(
              icon: Image.asset('assets/telegram.png'),
              onPressed: () {
                _launchURL('https://web.telegram.org/a/');
              },
            ),
            IconButton(
              icon: Image.asset('assets/linkedin.png'),
              onPressed: () {
                _launchURL('https://www.linkedin.com/in/esta-purwanti-625215289?trk=contact-info');
              },
            ),
          ],
        ),
      ),
    );
  }
}
