import 'package:flutter/material.dart';
import '../models/semester.dart';
import '../models/subject.dart';
import '../utils/grades.dart';

class SemesterPage extends StatefulWidget {
  final Semester semester;

  const SemesterPage({super.key, required this.semester});

  @override
  _SemesterPageState createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  void addSubject() {
    setState(() {
      widget.semester.subjects.add(Subject(name: '', grade: grades[0], credit: 0));
    });
  }

  void updateGPA() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Semester ${widget.semester.number}'),backgroundColor: Colors.deepPurple,foregroundColor: Colors.white,),
      body: Container(
  color: Colors.purple[50],   // 🔹 Page background color
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [
      Text(
        'Semester GPA: ${widget.semester.gpa.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,   // 🔹 Text color
        ),
      ),
      const SizedBox(height: 10),
      Expanded(
        child: ListView.builder(
          itemCount: widget.semester.subjects.length,
          itemBuilder: (context, index) {
            final subj = widget.semester.subjects[index];
            return Card(
              color: Colors.white,   // Card color (optional)
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(color: Colors.deepPurple),
                      decoration: InputDecoration(
                        labelText: 'Module Name',
                        labelStyle: const TextStyle(color: Colors.deepPurple),
                        filled: true,
                        fillColor: Colors.purple[100],
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) => subj.name = value,
                    ),

                    DropdownButton<String>(
                      value: subj.grade,
                      dropdownColor: Colors.purple[100],  // Dropdown BG
                      items: grades.map((grade) {
                        return DropdownMenuItem<String>(
                          value: grade,
                          child: Text(
                            grade,
                            style: const TextStyle(color: Colors.deepPurple),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          subj.grade = value!;
                        });
                      },
                    ),

                    TextField(
                      style: const TextStyle(color: Colors.deepPurple),
                      decoration: InputDecoration(
                        labelText: 'Credit Hours',
                        labelStyle: const TextStyle(color: Colors.deepPurple),
                        filled: true,
                        fillColor: Colors.purple[100],
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => subj.credit = double.tryParse(value) ?? 0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      ElevatedButton(
        onPressed: addSubject,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        child: const Text('Add Module'),
      ),

      const SizedBox(height: 10),

      ElevatedButton(
        onPressed: updateGPA,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        child: const Text('Update GPA'),
      ),

      const SizedBox(height: 40),
    ],
  ),
),

    );
  }
}
