import 'package:flutter/material.dart';
import 'package:myapp/features/quiz/start_quized.dart';

class QuizStartPage<QuizStartPageState> extends StatefulWidget {
  const QuizStartPage({super.key});

  @override
  createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  final List<Map<String, dynamic>> subjects = [
    {'name': 'Mathematics', 'icon': Icons.calculate},
    {'name': 'Science', 'icon': Icons.science},
    {'name': 'History', 'icon': Icons.history},
    {'name': 'Geography', 'icon': Icons.map},
    {'name': 'Literature', 'icon': Icons.book},
    {'name': 'Art', 'icon': Icons.palette},
    {'name': 'Physics', 'icon': Icons.devices},
    {'name': 'Chemistry', 'icon': Icons.thermostat},
    {'name': 'Biology', 'icon': Icons.biotech},
    {'name': 'Economics', 'icon': Icons.monetization_on},
    {'name': 'Music', 'icon': Icons.music_note},
    {'name': 'Philosophy', 'icon': Icons.comment},
    {'name': 'Computer Science', 'icon': Icons.computer},
    {'name': 'Psychology', 'icon': Icons.psychology},
    {'name': 'Sociology', 'icon': Icons.group},
    {'name': 'Political Science', 'icon': Icons.public},
    {'name': 'Business', 'icon': Icons.business},
    {'name': 'Engineering', 'icon': Icons.engineering},
    {'name': 'Astronomy', 'icon': Icons.star},
    {'name': 'Law', 'icon': Icons.gavel},
  ];

  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Subject'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubject = subject['name'];
                      });
                    },
                    child: SubjectCard(
                      subjectName: subject['name']!,
                      subjectIcon: subject['icon']!,
                      isSelected: selectedSubject == subject['name'],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedSubject == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuizPage(subject: selectedSubject!),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
              ),
              child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subjectName;
  final IconData subjectIcon;
  final bool isSelected;

  const SubjectCard({
    super.key,
    required this.subjectName,
    required this.subjectIcon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected
          ? const Color(0xFF1E2742).withOpacity(0.005)
          : Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isSelected ? const Color(0xFF1E2742) : Colors.grey,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            subjectIcon,
            size: 80,
            color: isSelected ? const Color(0xFF1E2742) : Colors.black87,
          ),
          const SizedBox(height: 10),
          Text(
            subjectName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? const Color(0xFF1E2742) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
