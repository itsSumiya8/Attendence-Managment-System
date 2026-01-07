import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int _selectedIndex = 0;

  final List<String> _titles = ["Report", "Details", "Export"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 129, 230),
        centerTitle: true,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildPageContent(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 75, 129, 230),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Report"),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: "Details",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: "Export"),
        ],
      ),
    );
  }

  Widget _buildPageContent(int index) {
    switch (index) {
      case 0: // SUMMARY
        return Column(
          children: [
            Row(
              children: [
                _summaryCard(
                  title: "Present",
                  value: "120",
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
                const SizedBox(width: 12),
                _summaryCard(
                  title: "Absent",
                  value: "15",
                  icon: Icons.cancel,
                  color: Colors.red,
                ),
                const SizedBox(width: 12),
                _summaryCard(
                  title: "Leave",
                  value: "8",
                  icon: Icons.info,
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        );

      case 1: // DETAILS
        return ListView(
          children: [
            _reportTile(
              icon: Icons.calendar_today,
              title: "Daily Report",
              subtitle: "Attendance by date",
            ),
            _reportTile(
              icon: Icons.date_range,
              title: "Monthly Report",
              subtitle: "Attendance summary per month",
            ),
            _reportTile(
              icon: Icons.people,
              title: "Student Report",
              subtitle: "Attendance per student",
            ),
            _reportTile(
              icon: Icons.school,
              title: "Course Report",
              subtitle: "Attendance per course",
            ),
          ],
        );

      case 2: // EXPORT
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.download,
                size: 60,
                color: Color.fromARGB(255, 75, 129, 230),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Exported Successfully!")),
                  );
                },
                icon: const Icon(Icons.download),
                label: const Text("Export Report"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 75, 129, 230),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        );

      default:
        return const Center(child: Text("Unknown tab"));
    }
  }

  // SUMMARY CARD
  Widget _summaryCard({
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
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 8),
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

  // REPORT TILE
  Widget _reportTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(icon, color: Colors.blue.shade700),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("$title tapped!")));
        },
      ),
    );
  }
}
