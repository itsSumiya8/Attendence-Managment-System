import 'package:flutter/material.dart';

class MarkAttendancePage extends StatefulWidget {
  const MarkAttendancePage({super.key});

  @override
  State<MarkAttendancePage> createState() => _MarkAttendancePageState();
}

class _MarkAttendancePageState extends State<MarkAttendancePage> {
  DateTime selectedDate = DateTime.now();

  final List<Map<String, String>> students = [
    {"name": "Ahmed Ali Hassan", "status": "Present"},
    {"name": "Ayaan Mohamed Ali", "status": "Present"},
    {"name": "Mohamed Abdi Noor", "status": "Absent"},
    {"name": "Hodan Yusuf Ahmed", "status": "Leave"},
  ];

  Color _statusColor(String status) {
    switch (status) {
      case "Present":
        return Colors.green;
      case "Absent":
        return Colors.red;
      case "Leave":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 129, 230),
        centerTitle: true,
        title: const Text(
          "Mark Attendance",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // DATE
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 5),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Color.fromARGB(255, 75, 129, 230),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Date: ${selectedDate.toString().split(' ')[0]}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (picked != null) {
                        setState(() => selectedDate = picked);
                      }
                    },
                    child: const Text("Change"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // STUDENT LIST
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NAME ROW
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue.shade100,
                              child: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 75, 129, 230),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                student["name"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _statusColor(
                                  student["status"]!,
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                student["status"]!,
                                style: TextStyle(
                                  color: _statusColor(student["status"]!),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // STATUS BUTTONS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _statusButton(
                              title: "Present",
                              color: Colors.green,
                              isSelected: student["status"] == "Present",
                              onTap: () {
                                setState(() {
                                  student["status"] = "Present";
                                });
                              },
                            ),

                            _statusButton(
                              title: "Absent",
                              color: Colors.red,
                              isSelected: student["status"] == "Absent",
                              onTap: () {
                                setState(() {
                                  student["status"] = "Absent";
                                });
                              },
                            ),

                            _statusButton(
                              title: "Leave",
                              color: Colors.orange,
                              isSelected: student["status"] == "Leave",
                              onTap: () {
                                setState(() {
                                  student["status"] = "Leave";
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // SAVE
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.save),
                label: const Text(
                  "Save Attendance",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Attendance saved successfully"),
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // STATUS BUTTON
  Widget _statusButton({
    required String title,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? color : color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
