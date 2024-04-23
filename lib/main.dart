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
      backgroundColor:
          Colors.transparent, // Make Scaffold background transparent
      body: Stack(
        // Use Stack to overlay the background image with other content
        children: <Widget>[
          // Background Image with Blur Effect
          Positioned.fill(
            child: Image.asset(
              'assets/dark_bg.jpg', // Path to your textured background image
              fit: BoxFit.cover,
              color: Color.fromARGB(255, 171, 174, 211)
                  .withOpacity(0.6), // Adjust opacity as needed
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
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Esta Purwanti | STI202102181',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'STMIK Widya Utama Purwokerto',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'My Story',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'I am a passionate technology student. Finding an interest in Computer Science during the sixth semester at STMIK Widya Utama Purwokerto gave me valuable experience in the Merdeka MSIB program at Bangkit Academy, focusing on Cloud Computing. Actively involved in projects to increase digital literacy in disadvantaged communities , I conducted workshops to empower individuals with digital skills. Seeing their enthusiasm strengthened my belief in the potential of technology to have a positive impact on society.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0), // Add some space between cards
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Personal Information',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Age: 20 years old',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors
                                    .grey, // Add a grey line below the text
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Phone: +62-8504-7338-2022',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors
                                    .grey, // Add a grey line below the text
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Email: estapurwanti@gmail.com',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors
                                    .grey, // Add a grey line below the text
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Address: Jalan Randualas, Desa Kediri Jambon, RT 03 RW 06, Kecamatan Karanglewas, Kabupaten Banyumas, Jawa Tengah', // Removed extra quotation marks
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                _launchURL(
                    'https://www.linkedin.com/in/esta-purwanti-625215289?trk=contact-info');
              },
            ),
          ],
        ),
      ),
    );
  }
}
