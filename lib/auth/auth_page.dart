import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthPage<AuthPageState> extends StatefulWidget {
  const AuthPage({super.key});

  @override
  createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  // Function to handle Google Sign-In
  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        await _checkUserInDatabase(user);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error (you could show a Snackbar or Toast)
      print("Error during Google Sign-In: $e");
    }
  }

  // Function to check if the user is new or existing
  Future<void> _checkUserInDatabase(User user) async {
    final DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(user.uid).get();
    if (userDoc.exists) {
      // User already exists, navigate to HomePage
      Navigator.pushReplacementNamed(context, '/homepage');
    } else {
      // User is new, navigate to OnboardingPage
      await _firestore.collection('users').doc(user.uid).set({
        'email': user.email,
        'name': user.displayName,
        'createdAt': FieldValue.serverTimestamp(),
      });
      Navigator.pushReplacementNamed(context, '/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Sign-In")),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _signInWithGoogle,
                child: const Text("Sign in with Google"),
              ),
      ),
    );
  }
}
