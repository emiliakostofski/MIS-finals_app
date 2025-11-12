import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_card.dart';
import 'package:my_first_app/screens/details.dart' as details;

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subject: 'Структурно Програмирање', dateTime: DateTime(2025, 1, 12, 9, 0), rooms: ['ЛАБ 13', 'ЛАБ 12']),
    Exam(subject: 'Бази на податоци', dateTime: DateTime(2025, 1, 15, 12, 0), rooms: ['ЛАБ 138']),
    Exam(subject: 'Оперативни системи', dateTime: DateTime(2025, 12, 29, 10, 0), rooms: ['ЛАБ 3']),
    Exam(subject: 'Компјутерски Мрежи', dateTime: DateTime(2025, 1, 20, 9, 0), rooms: ['ЛАБ 2']),
    Exam(subject: 'Информациска безбедност', dateTime: DateTime(2025, 2, 1, 10, 0), rooms: ['ЛАБ 215']),
    Exam(subject: 'Мобилни информациски системи', dateTime: DateTime(2025, 11, 25, 13, 0), rooms: ['ЛАБ 200АБ']),
    Exam(subject: 'Веб Програмирање', dateTime: DateTime(2025, 1, 27, 9, 0), rooms: ['ЛАБ 200Б']),
    Exam(subject: 'Електронска и мобилна трговија', dateTime: DateTime(2025, 2, 5, 10, 0), rooms: ['ЛАБ 215']),
    Exam(subject: 'Дискретна Математика', dateTime: DateTime(2024, 12, 10, 8, 30), rooms: ['ЛАБ 12']),
    Exam(subject: 'Алгоритми и податочни структури', dateTime: DateTime(2025, 12, 10, 9, 0), rooms: ['ЛАБ 138']),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 223315'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 12, 
            runSpacing: 12, 
            children: exams.map((exam) {
              return SizedBox(
                width: 200,
                height: 200,
                child: ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => details.ExamDetailScreen(exam: exam),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Вкупно испити: ${exams.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
