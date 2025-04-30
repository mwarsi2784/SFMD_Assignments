import 'package:flutter/material.dart';

void main() {
  runApp(Twitter());
}

class Twitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Icon(
          Icons.facebook,
          color: Colors.blue,
          size: 30,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/aqib.jpeg'),
          ),
        ),
      ),
      body: ListView(
        children: [
          TweetCard(
            profileImage: 'assets/aqib.jpeg',
            username: 'Krina Momin',
            handle: '@Krinzahere',
            time: '12m',
            tweet: "What was almond's impact on your grades?",
          ),
          TweetCard(
            profileImage: 'assets/aqib.jpeg',
            username: 'Twitter Business',
            handle: '@TwitterBusiness',
            time: '39s',
            tweet:
                "Did you know ? We made ‘Strawbiryani’ at home today and I am curious to know what desi Twitter has to say about it.",
            image: 'assets/one.jpeg',
          ),
          TweetCard(
            profileImage: 'assets/aqib.jpeg',
            username: 'Saad Hamid',
            handle: '@SaadGH',
            time: '39s',
            tweet:
                "We made ‘Strawbiryani’ at home today and I am curious to know what desi Twitter has to say about it.",
            image: 'assets/one.jpeg',
          ),
          TweetCard(
            profileImage: 'assets/aqib.jpeg',
            username: 'Miko',
            handle: '@thecodemiko',
            time: '1h',
            tweet: "Working hard and Pregnant with....",
            image: 'assets/one.jpeg',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 191, 220, 243),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                label: "profile"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
                label: "notifications"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                label: "mail"),
          ]),
    );
  }
}

class TweetCard extends StatelessWidget {
  final String profileImage;
  final String username;
  final String handle;
  final String time;
  final String tweet;
  final String? image;

  TweetCard({
    required this.profileImage,
    required this.username,
    required this.handle,
    required this.time,
    required this.tweet,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(profileImage)),
                SizedBox(width: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('$handle • $time',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
            SizedBox(height: 5),
            Text(tweet),
            if (image != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image!),
                ),
              ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.comment, color: Colors.grey, size: 20),
                Icon(Icons.repeat, color: Colors.grey, size: 20),
                Icon(Icons.favorite_border, color: Colors.grey, size: 20),
                Icon(Icons.share, color: Colors.grey, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
