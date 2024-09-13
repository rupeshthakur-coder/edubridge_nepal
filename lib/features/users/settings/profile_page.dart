import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the current user from FirebaseAuth
    final User? user = FirebaseAuth.instance.currentUser;

    // Reference to Firestore document for the current user
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(user?.uid);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E2742),
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: userDoc.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No user data available'));
          }

          // Fetch user data from Firestore
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final name = userData['name'] ?? 'No Name';
          final email = user?.email ?? 'No Email';
          final dob = userData['dob'] ?? 'No Date of Birth';
          final phone = userData['phone'] ?? 'No Phone Number';
          final address = userData['address'] ?? 'No Address';
          final enrolledCourses = List<String>.from(userData['courses'] ?? []);

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                      'assets/illustration.svg'), // Use dynamic image if available
                ),
                const SizedBox(height: 15.0),

                // User's Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5.0),

                // User's Email
                Text(
                  email,
                  style: const TextStyle(
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
                      _profileDetail('Date of Birth:', dob),
                      _profileDetail('Phone Number:', phone),
                      _profileDetail('Address:', address),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),

                // Enrolled Courses Section
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
                _courseList(enrolledCourses),

                const SizedBox(height: 20.0),

                // Logout Option
                // _profileOption(context, Icons.logout, 'Log Out', () {
                //   FirebaseAuth.instance.signOut().then((_) {
                //     Navigator.of(context).pushAndRemoveUntil(

                //         '/login'); // Replace with actual login route
                //   }).catchError((error) {
                //     // Handle any sign-out errors here if needed
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Error logging out: $error')),
                //     );
                //   });
                // }),

                _profileOption(context, Icons.logout, 'Log Out', () {
                  FirebaseAuth.instance.signOut().then((_) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', // Replace with your actual login route
                      (Route<dynamic> route) =>
                          false, // Clear all previous routes
                    );
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error logging out: $error')),
                    );
                  });
                }),

                const SizedBox(height: 20.0),
              ],
            ),
          );
        },
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
  Widget _courseList(List<String> courses) {
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

  Widget _profileOption(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logging out...')),
          );
          onTap(); // Call the provided onTap action (logout logic)
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.red,
        ),
        child: Text(title),
      ),
    );
  }
}
