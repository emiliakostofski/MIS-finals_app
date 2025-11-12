import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    if (diff.isNegative) return 'Испитот е завршен';
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Датум: ${DateFormat('dd.MM.yyyy – HH:mm').format(exam.dateTime)}',
              style: TextStyle(
                fontSize: 18,
                color: isPast ? Colors.red : Colors.green, 
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Простории: ${exam.rooms.join(', ')}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Време до испитот: ${timeUntilExam()}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isPast ? Colors.red : Colors.green, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
