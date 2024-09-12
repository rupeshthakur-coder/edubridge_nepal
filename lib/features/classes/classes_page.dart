import 'package:flutter/material.dart';

class ClassListPage<ClassListPageState> extends StatefulWidget {
  const ClassListPage({super.key});

  @override
  createState() => _ClassListPageState();
}

class _ClassListPageState extends State<ClassListPage> {
  // List of classes with details
  final List<Map<String, String>> classes = [
    {'name': 'Mathematics', 'time': '9:00 AM - 10:00 AM'},
    {'name': 'Science', 'time': '10:30 AM - 11:30 AM'},
    {'name': 'History', 'time': '12:00 PM - 1:00 PM'},
    {'name': 'Geography', 'time': '1:30 PM - 2:30 PM'},
    {'name': 'Literature', 'time': '3:00 PM - 4:00 PM'},
    {'name': 'Physics', 'time': '4:30 PM - 5:30 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Classes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            final classInfo = classes[index];
            return ClassCard(
              className: classInfo['name']!,
              classTime: classInfo['time']!,
              onJoinPressed: () {
                // Handle join class logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Joining ${classInfo['name']} class...')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// Custom widget for each class card
class ClassCard extends StatelessWidget {
  final String className;
  final String classTime;
  final VoidCallback onJoinPressed;

  const ClassCard({
    super.key,
    required this.className,
    required this.classTime,
    required this.onJoinPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              className,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              classTime,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onJoinPressed,
                child: const Text('Join Class'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
