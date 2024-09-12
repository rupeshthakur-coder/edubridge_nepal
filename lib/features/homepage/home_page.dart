import 'package:flutter/material.dart';
import 'package:myapp/features/assignments/assignments_page.dart';
import 'package:myapp/features/classes/classes_page.dart';

import 'package:myapp/features/notes/note_page.dart';
import 'package:myapp/features/quiz/quized_page.dart';
import 'package:myapp/features/settings/profile_page.dart';
import 'package:myapp/features/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E2742),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
            color: Colors.white,
          );
        }),
        title: const Text('EduBridge', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://mighty.tools/mockmind-api/content/cartoon/14.jpg'),
                  radius: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1E2742),
              ),
              child: Text(
                'Student Resources',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.class_),
                title: const Text('Classes'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ClassListPage()),
                  );
                }),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text('Notes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DocumentPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Assignments'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AssignmentsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.quiz),
              title: const Text('Quizzes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuizStartPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.logout),
            //   title: const Text('Logout'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Unlock Your Potential with EduBridge',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E2742),
                ),
              ),
              // Header Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'We believe that education is key to personal and professional growth, and we’re here to guide you on your journey to success.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-vector/schoolboy-standing-books-raising-hand-speaking-pupil-reading-home-task-report-flat-vector-illustration-school-education-knowledge_74855-8576.jpg'),
                  ),
                ],
              ),

              // Top Categories
              const SectionHeader(title: 'Top Categories'),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  CategoryCard(
                      title: 'Astrology',
                      courses: 11,
                      url:
                          'https://img.freepik.com/free-vector/tiny-characters-with-symbols-zodiac-signs-magic-ball-stars-constellations-woman-reading-horoscope-flat-vector-illustration-astrology-astronomy-concept-banner-landing-web-page_74855-20971.jpg'),
                  CategoryCard(
                      title: 'Development',
                      courses: 12,
                      url:
                          'https://www.shutterstock.com/image-vector/flat-design-style-web-banner-260nw-734948962.jpg'),
                  CategoryCard(
                      title: 'Marketing',
                      courses: 12,
                      url:
                          'https://img.freepik.com/free-vector/students-with-laptops-sitting-around-lector-interactive-board-illustration_335657-261.jpg'),
                  CategoryCard(
                      title: 'Physics',
                      courses: 14,
                      url:
                          'https://img.freepik.com/free-vector/physics-school-subject-concept-scientist-explore-electricity-magnetism-light-wave-forces-theoretical-practical-study-physics-lesson-experiment-isolated-vector-illustration_613284-1911.jpg'),
                ],
              ),
              const SizedBox(height: 20),

              // Top Instructors Section
              const SectionHeader(title: 'Top Instructors'),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  InstructorCard(name: 'Ronald Richards', students: 2400),
                  InstructorCard(name: 'Jane Doe', students: 3000),
                ],
              ),
              const SizedBox(height: 20),
              // Top Courses Section
              const SectionHeader(title: 'Top Courses'),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  CourseCard(
                      title: 'Beginner\'s Guide to Design',
                      instructor: 'Ronald Richards',
                      price: 149.9),
                  CourseCard(
                      title: 'Beginner\'s Guide to Development',
                      instructor: 'Jane Doe',
                      price: 199.9),
                ],
              ),
              const SizedBox(height: 40),
              // Testimonials Section
              const SectionHeader(title: 'What Our Customers Say About Us'),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 1,
                children: const [
                  TestimonialCard(
                      content:
                          'EduBridge\'s tech courses are top-notch! As someone who\'s always looking to stay ahead, I appreciate the up-to-date content.',
                      name: 'Jane Doe'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Smooth Scrolling Image Widget
  Widget smoothImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(imageUrl, fit: BoxFit.cover, width: 300),
      ),
    );
  }
}

// Stat Card Widget
class StatCard extends StatelessWidget {
  final String label;
  final String subLabel;

  const StatCard({super.key, required this.label, required this.subLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(subLabel,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}

// Category Card Widget
class CategoryCard extends StatelessWidget {
  final String title;
  final int courses;
  final String url;

  const CategoryCard(
      {super.key,
      required this.title,
      required this.courses,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(243, 35, 47, 84),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              url, width: 130, // You can set width and height as needed
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
            Text('$courses Courses',
                style: const TextStyle(color: Colors.white60)),
          ],
        ),
      ),
    );
  }
}

// Course Card Widget
class CourseCard extends StatelessWidget {
  final String title;
  final String instructor;
  final double price;

  const CourseCard({
    super.key,
    required this.title,
    required this.instructor,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(221, 30, 39, 66),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 16, color: Colors.white)),
                Text('By $instructor',
                    style:
                        const TextStyle(color: Colors.white54, fontSize: 14)),
                const SizedBox(height: 10),
                Text('\$$price',
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Instructor Card Widget
class InstructorCard extends StatelessWidget {
  final String name;
  final int students;

  const InstructorCard({super.key, required this.name, required this.students});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(221, 30, 39, 66),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://w7.pngwing.com/pngs/644/43/png-transparent-teacher-tutor-education-teacher-hand-cartoon-fictional-character-thumbnail.png'),
              radius: 30,
            ),
            const SizedBox(height: 10),
            Text(name,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
            Text('$students Students',
                style: const TextStyle(color: Colors.white54, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

// Testimonial Card Widget
class TestimonialCard extends StatelessWidget {
  final String content;
  final String name;

  const TestimonialCard({super.key, required this.content, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E2742),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.format_quote, size: 30, color: Colors.white),
          const SizedBox(height: 10),
          Text(content,
              style: const TextStyle(fontSize: 16, color: Colors.white)),
          const SizedBox(height: 10),
          Text('- $name', style: const TextStyle(color: Colors.white54)),
          const SizedBox(height: 10), // Add some spacing here if needed
          Image.network(
            'https://media.istockphoto.com/id/1352938896/vector/witness-taking-oath.jpg?s=612x612&w=0&k=20&c=9kEbaTDbRNnhoVNtbR4UlcKq5mQGitH8ajSf0ifNPhM=',
            width: 350, // You can set width and height as needed
            height: 165,
            fit: BoxFit.cover, // Adjust as needed
          ),
        ]),
      ),
    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
