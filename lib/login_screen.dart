// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>(); // Add a key for the form
  String email = '';
  String password = '';
  String errorMessage = ''; // To display error messages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Make it scrollable
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // Add some padding
        child: Form( // Wrap your Column in a Form widget
          key: _formKey, // Associate your form key
          child: Column(
            children: [
              TextFormField( // Use TextFormField for validation
                onChanged: (value) {
                  email = value.trim(); // Trim to remove extra spaces
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (value) => (value == null || !value.contains('@')) ? 'Enter a valid email' : null,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                validator: (value) => (value == null || value.length < 6) ? 'Password must be at least 6 characters' : null,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) { // Check if the form is valid
                    try {
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if (user != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()), // Navigate to HomeScreen after login
                        );
                      }
                    } catch (e) {
                      setState(() {
                        errorMessage = e.toString();
                      });
                    }
                  }
                },
                child: const Text('Log In'),
              ),
              if (errorMessage.isNotEmpty) // Display the error message if there is one
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(errorMessage, style: const TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
