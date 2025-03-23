import 'package:flutter/material.dart';

void main() {
  runApp(FoodpandaClone());
}

class FoodpandaClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodpanda UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final restaurants = List.generate(5, (index) => 'Restaurant $index');
  final double imageHeight = 100;

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget restaurantCard(String title, {String? tag}) {
    return Container(
      width: 180,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/food.jpg',
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (tag != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          Text("Rs. 50 Delivery fee", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget horizontalList(String title, {bool showTag = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle(title),
        Container(
          height: imageHeight + 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
                restaurants
                    .map(
                      (r) =>
                          restaurantCard(r, tag: showTag ? "FEATURED" : null),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Restaurant Delivery",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              "Askari IV Apartments, Karachi",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [Icon(Icons.favorite_border), SizedBox(width: 10)],
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search for restaurant, cuisines...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            // Promo Cards with Images
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  promoImageCard("assets/ghar_ka_khana.jpg"),
                  promoImageCard("assets/deals_111.jpg"),
                  promoImageCard("assets/flat_75.jpg"),
                ],
              ),
            ),
            horizontalList("Your restaurants", showTag: true),
            horizontalList("Hat-trick Deals", showTag: true),
            horizontalList("Featured", showTag: true),
            horizontalList("Ghar ka Khana"),
            horizontalList("Straight Out of Kitchen", showTag: true),
            horizontalList("New on foodpanda", showTag: true),
            horizontalList("All restaurants", showTag: true),
          ],
        ),
      ),
    );
  }

  Widget promoImageCard(String imagePath) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
