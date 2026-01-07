import 'package:flutter/material.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<Map<String, dynamic>> students = List.generate(
    120,
    (index) => {
      "name": index % 2 == 0 ? "Ahmed Student $index" : "Ayaan Student $index",
      "id": "ID: ${1000 + index}",
      "gender": index % 2 == 0 ? "male" : "female",
    },
  );

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 129, 230),
        elevation: 0,
        title: const Text(
          "Students",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            return _studentCard(
              context,
              name: student["name"],
              id: student["id"],
              gender: student["gender"],
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 75, 129, 230),
        child: const Icon(Icons.add),
        onPressed: () {
          _showAddStudentDialog(context);
        },
      ),
    );
  }

  // STUDENT CARD
  Widget _studentCard(
    BuildContext context, {
    required String name,
    required String id,
    required String gender,
  }) {
    // URLs for network images
    String imageUrl = gender == "male"
        ? "https://i.ibb.co/2nq1S7v/male.png"
        : "https://i.ibb.co/3f3tHjF/female.png";

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.pushNamed(context, '/attendance');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // NETWORK IMAGE with fallback
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.shade100,
              child: ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // fallback image if network fails
                    return Image.network(
                      "https://i.ibb.co/7rP5H2y/placeholder.png",
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(id, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // ADD STUDENT DIALOG
  void _showAddStudentDialog(BuildContext context) {
    String gender = "male"; // default

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Student"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Full Name"),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: gender,
                items: const [
                  DropdownMenuItem(value: "male", child: Text("Male")),
                  DropdownMenuItem(value: "female", child: Text("Female")),
                ],
                onChanged: (value) {
                  gender = value!;
                },
                decoration: const InputDecoration(labelText: "Gender"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _nameController.clear();
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.trim().isNotEmpty) {
                  setState(() {
                    students.add({
                      "name": _nameController.text.trim(),
                      "id": "ID: ${1000 + students.length}",
                      "gender": gender,
                    });
                  });
                  _nameController.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
