import 'package:flutter/material.dart';
import '../models/semester.dart';
import '../utils/grades.dart';
import 'semester_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Semester> semesters = [];

  void addSemester() {
    int nextNumber = semesters.length + 1;
    Semester newSemester = Semester(number: nextNumber);
    semesters.add(newSemester);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SemesterPage(semester: newSemester),
      ),
    ).then((_) {
      setState(() {}); // refresh MainPage after returning
    });
  }

  double get cumulativeGPA {
    double totalPoints = 0;
    double totalCredits = 0;
    for (var sem in semesters) {
      for (var sub in sem.subjects) {
        double? points = gradePoints[sub.grade];
        if (points != null) {
          totalPoints += points * sub.credit;
          totalCredits += sub.credit;
        }
      }
    }
    return totalCredits > 0 ? totalPoints / totalCredits : 0.0;
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('GPA Tracker'),backgroundColor: Colors.deepPurple,foregroundColor: Colors.white,),
    body: Container(
      color: Colors.purple[100], 
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Cumulative GPA: ${cumulativeGPA.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: semesters.length,
              itemBuilder: (context, index) {
                final sem = semesters[index];
                return Card(
                  color: Colors.deepPurple[400], 
                  child: ListTile(
                    title: Text('Semester ${sem.number}',
                    style: TextStyle(
                    color: Colors.white,         
                    fontWeight: FontWeight.bold,  

                    ),),
                    subtitle: Text('GPA: ${sem.gpa.toStringAsFixed(2)}',
                    style: TextStyle(
                    color: Colors.white,         
                    fontWeight: FontWeight.bold,  
                    ),),
                    
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SemesterPage(semester: sem),
                        ),
                      ).then((_) => setState(() {}));
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              onPressed: addSemester,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,),
              child: Text('Add New Semester'),
            ),
          ),
        ],
      ),
    ),
  );
}
}