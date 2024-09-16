import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPageTeacher<SignInPageTeacherState> extends StatefulWidget {
  const SignInPageTeacher({super.key});

  @override
  createState() => _SignInPageTeacherState();
}

class _SignInPageTeacherState extends State<SignInPageTeacher> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User? user) async {
      if (user != null) {
        await _checkUserInDatabase(user);
      }
    });
  }

  Future<void> _signInWithEmailAndPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      try {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        final User? user = userCredential.user;
        if (user != null) {
          await _checkUserInDatabase(user);
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          _emailController.clear();
          _passwordController.clear();
        });
        _showErrorDialog('Sign in failed: $e');
      }
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in aborted by user');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          await _checkUserInDatabase(user);
        }
      } else {
        throw Exception('Google authentication failed');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog('Google sign-in failed: $e');
    }
  }

  Future<void> _checkUserInDatabase(User user) async {
    final DocumentSnapshot userDoc =
        await _firestore.collection('teachers').doc(user.uid).get();

    if (userDoc.exists) {
      Navigator.pushReplacementNamed(context, '/teacher_homepage');
    } else {
      await _saveNewTeacherInDatabase(user);
      Navigator.pushReplacementNamed(context, '/teacher_onboarding');
    }
  }

  Future<void> _saveNewTeacherInDatabase(User user) async {
    await _firestore.collection('teachers').doc(user.uid).set({
      'email': user.email,
      'name': user.displayName ?? 'Unknown',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  bool _validateEmail(String email) {
    const emailPattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Sign In"),
        backgroundColor: const Color(0xFF1E2742),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Welcome Back, Teacher!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF1E2742)),
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!_validateEmail(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF1E2742)),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_isPasswordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _signInWithEmailAndPassword,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                            backgroundColor: const Color(0xFF1E2742),
                          ),
                          child: const Text("Sign In"),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _signInWithGoogle,
                          icon: const Icon(Icons.login),
                          label: const Text("Sign in with Google"),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                            backgroundColor: const Color(0xFF1E2742),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                            backgroundColor: const Color(0xFF1E2742),
                          ),
                          child: const Text("Continue as a Student"),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/sign_up_as_teacher');
                          },
                          child: const Text("Don't have an account? Sign Up"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
