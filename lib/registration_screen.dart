import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart'; // Assuming you have a HomeScreen widget

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String email = '';
  String password = '';
  bool isLoading = false; // To control loading indicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    email = value.trim();
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
                  validator: (value) => (value == null || value.length < 6) ? 'Password must be at least 6 characters long' : null,
                ),
                ElevatedButton(
                  onPressed: isLoading ? null : () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() => isLoading = true);
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        // ignore: unnecessary_null_comparison
                        if (newUser != null) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        }
                      } catch (e) {
                        // Handle the error, e.g., show a snackbar
                      } finally {
                        setState(() => isLoading = false);
                      }
                    }
                  },
                  child: isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}