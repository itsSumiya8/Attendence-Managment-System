import 'package:flutter/material.dart';

// import pages
import 'login_page.dart';
import 'dashboard_page.dart';
import 'course_pages.dart';
import 'students_pages.dart';
import 'markattendance_page.dart';
import 'reports_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // route bilow
      initialRoute: '/',

      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/courses': (context) => const CoursesPage(),
        '/students': (context) => const StudentsPage(),
        '/attendance': (context) => const MarkAttendancePage(),
        '/reports': (context) => const ReportsPage(),
      },
    );
  }
}
