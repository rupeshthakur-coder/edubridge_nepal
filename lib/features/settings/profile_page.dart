import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E2742),
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),

            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/illustration.svg'),
            ),
            const SizedBox(height: 15.0),

            const Text(
              'Rupesh Thakur', // Replace with dynamic data
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5.0),

            // User's Email
            const Text(
              'rupesh.thakur@example.com', // Replace with dynamic data
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15.0),

            // User's Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _profileDetail('Date of Birth:', 'January 1, 1990'),
                  _profileDetail('Phone Number:', '+1 234 567 890'),
                  _profileDetail('Address:', '123 Main St, Hometown, USA'),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // Enrolled Courses
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Enrolled Courses',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            _courseList(),

            const SizedBox(height: 20.0),

            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle profile edit action
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E2742),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

            const SizedBox(height: 30.0),

            // Settings and Logout Buttons
            _profileOption(Icons.settings, 'Settings', () {
              // Handle Settings tap
            }),
            const Divider(),
            _profileOption(Icons.logout, 'Log Out', () {
              // Handle Logout tap
            }),

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  // Widget for profile detail information
  Widget _profileDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for displaying the list of courses
  Widget _courseList() {
    // Sample course data
    final List<String> courses = [
      'Mathematics 101',
      'Introduction to Programming',
      'Data Structures and Algorithms',
      'Flutter Development',
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2742).withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              courses[index],
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _profileOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18.0),
      ),
      onTap: onTap,
    );
  }
}
