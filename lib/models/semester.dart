import 'subject.dart';
import '../utils/grades.dart';



class Semester {
  int number;
  List<Subject> subjects = [];

  Semester({required this.number});

  double get gpa {
    double totalPoints = 0;
    double totalCredits = 0;
    for (var sub in subjects) {
      double? points = gradePoints[sub.grade];
      if (points != null) {
        totalPoints += points * sub.credit;
        totalCredits += sub.credit;
      }
    }
    return totalCredits > 0 ? totalPoints / totalCredits : 0.0;
  }
}
