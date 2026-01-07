import 'package:flutter/material.dart';

void main() {
  runApp(BbcNews());
}

class BbcNews extends StatelessWidget {
  const BbcNews({super.key});
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BBC News",
      theme: ThemeData(primaryColor: Colors.red, useMaterial3: false),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Row(
          children: const [
            Text(
              "BBC",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              "NEWS",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.language, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            "stories",
            style: TextStyle(
              color: Colors.red,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1499856871958-5b9627545d1a?q=80&w=1120&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
              child: const Text(
                "Brazil seeks funds to rebuild museum",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Headline",
            style: TextStyle(
              color: Colors.red,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          headlineItem(
            'https://ichef.bbci.co.uk/news/1536/cpsprodpb/11AC6/production/_103209327_mediaitem103209326.jpg.webp',
            "Trump warns of violence if Democrats win",
            "4h",
            "us&canada",
          ),
          headlineItem(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKgax-6miouZXT-CmY_TgF8kGHiYGYk7zmGw&s",
            "france and uk boats clash in scallop war",
            "7h",
            "Europe",
          ),
          headlineItem(
            "https://www.annapharmacy.com/wp-content/uploads/2022/03/blood-pressure1.jpg",
            'What can happen if high blood pressure is left untreated?',
            '5 hr',
            'Health',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: "my Feed",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "saved"),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: "video",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "LIVE"),
        ],
      ),
    );
  }

  Widget headlineItem(
    String image,
    String title,
    String time,
    String category,
  ) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "$time $category",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.bookmark_border),
          ),
        ],
      ),
    );
  }
}
