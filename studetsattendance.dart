import 'package:flutter/material.dart';

void main() {
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University Attendance',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}

/* ================= LOGIN SCREEN ================= */

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 90, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              "UNIVERSITY ATTENDANCE",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= HOME SCREEN ================= */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome, mr.Ahmed")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: const [
                StatCard("Total Students", "120", Colors.green),
                StatCard("Present Today", "95", Colors.orange),
                StatCard("Absent Today", "15", Colors.red),
                StatCard("Classes Today", "4", Colors.blue),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: const Text("View Courses"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CoursesScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= COURSES SCREEN ================= */

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      "Computer Science",
      "Marketing 101",
      "Business Management",
      "Psychology 205",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Courses")),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(courses[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StudentsScreen(course: courses[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/* ================= STUDENTS SCREEN ================= */

class StudentsScreen extends StatelessWidget {
  final String course;
  const StudentsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final students = [
      "Ahmed Ali Hassan",
      "Fatima Mohamed",
      "Abdirahman Yusuf",
      "Hodan Abdi",
      "Mohamed Noor",
      "Ayaan Ahmed",
    ];

    return Scaffold(
      appBar: AppBar(title: Text(course)),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(students[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AttendanceScreen(student: students[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/* ================= ATTENDANCE SCREEN ================= */

class AttendanceScreen extends StatelessWidget {
  final String student;
  const AttendanceScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mark Attendance")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              student,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                attendanceButton("Present", Colors.green),
                attendanceButton("Absent", Colors.red),
                attendanceButton("Late", Colors.orange),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: const Text("Save"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget attendanceButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: () {},
      child: Text(text),
    );
  }
}

/* ================= STAT CARD WIDGET ================= */

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const StatCard(this.title, this.value, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
