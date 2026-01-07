import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 75, 129, 230),
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // WELCOME
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 75, 129, 230),
                    Color.fromARGB(255, 75, 129, 230),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome 👋",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Student Attendance Management System",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ATTENDANCE STATS
            Row(
              children: [
                _statCard(
                  title: "Present",
                  value: "120",
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
                const SizedBox(width: 12),
                _statCard(
                  title: "Absent",
                  value: "15",
                  icon: Icons.cancel,
                  color: Colors.red,
                ),
                const SizedBox(width: 12),
                _statCard(
                  title: "Leave",
                  value: "8",
                  icon: Icons.info,
                  color: Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 75, 129, 230),
              ),
            ),

            const SizedBox(height: 15),

            // ACTION BUTTONS
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _actionCard(
                    icon: Icons.book,
                    title: "Courses",
                    onTap: () => Navigator.pushNamed(context, '/courses'),
                  ),

                  _actionCard(
                    icon: Icons.people,
                    title: "Students",
                    onTap: () => Navigator.pushNamed(context, '/students'),
                  ),

                  _actionCard(
                    icon: Icons.assignment_turned_in,
                    title: "Mark Attendance",
                    onTap: () => Navigator.pushNamed(context, '/attendance'),
                  ),

                  _actionCard(
                    icon: Icons.bar_chart,
                    title: "Reports",
                    onTap: () => Navigator.pushNamed(context, '/reports'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // STAT CARD
  static Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // ACTION CARD
  static Widget _actionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 75, 129, 230),
              Color.fromARGB(255, 75, 129, 230),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
