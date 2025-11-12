import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  String timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    if (diff.isNegative) {
      final days = diff.inDays.abs();
      final hours = (diff.inHours.abs() % 24);
      return 'Испитот е завршен пред $days дена, $hours часа';
    } else {
      final days = diff.inDays;
      final hours = diff.inHours % 24;
      return '$days дена, $hours часа';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPast = exam.dateTime.isBefore(DateTime.now());

    return InkWell(
      onTap: onTap,
      child: Card(
        color: isPast ? Colors.red.shade100 : Colors.green.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat('dd.MM.yyyy – HH:mm').format(exam.dateTime),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                timeUntilExam(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isPast ? Colors.red.shade800 : Colors.green.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
