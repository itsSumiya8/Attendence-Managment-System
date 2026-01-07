import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 129, 230),
        title: const Text(
          "Courses",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            _courseCard(
              context,
              title: "IoT",
              icon: Icons.sensors,
              color: const Color.fromARGB(255, 75, 129, 230),
            ),

            _courseCard(
              context,
              title: "PHP",
              icon: Icons.code,
              color: const Color.fromARGB(255, 75, 129, 230),
            ),

            _courseCard(
              context,
              title: "Python",
              icon: Icons.data_object,
              color: const Color.fromARGB(255, 75, 129, 230),
            ),

            _courseCard(
              context,
              title: "Web Development",
              icon: Icons.web,
              color: const Color.fromARGB(255, 75, 129, 230),
            ),

            _courseCard(
              context,
              title: "Mobile App",
              icon: Icons.phone_android,
              color: const Color.fromARGB(255, 75, 129, 230),
            ),

            _courseCard(
              context,
              title: "Networking",
              icon: Icons.router,
              color: const Color.fromARGB(255, 75, 129, 230),
            ),

            _courseCard(
              context,
              title: "AI",
              icon: Icons.psychology,
              color: const Color.fromARGB(255, 75, 129, 230),
            ),

            _courseCard(
              context,
              title: "Software Management System",
              icon: Icons.settings_suggest,
              color: const Color.fromARGB(255, 75, 129, 230),
            ),
          ],
        ),
      ),
    );
  }

  // COURSE CARD
  Widget _courseCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.pushNamed(context, '/students');
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.85), color.withOpacity(0.55)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 42),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
