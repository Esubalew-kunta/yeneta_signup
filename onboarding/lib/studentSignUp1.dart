import 'package:flutter/material.dart';
import 'package:onboarding/studentSignUp2.dart';

class StudentSignUpPage1 extends StatefulWidget {
  @override
  _StudentSignUpPageOneState createState() => _StudentSignUpPageOneState();
}

class _StudentSignUpPageOneState extends State<StudentSignUpPage1> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _givenNameController = TextEditingController();
  final TextEditingController _fathersNameController = TextEditingController();
  final TextEditingController _grandFathersNameController =
      TextEditingController();

  // Variables to store user input
  String? _selectedGender;

//
  // Regular expression for alphabetic validation
  final RegExp _alphabetRegex = RegExp(r'^[a-zA-Z]+$');

  // Function to validate and proceed to next page
  void _validateAndProceed() {
    if (_formKey.currentState!.validate() && _selectedGender != null) {
      // Proceed to the next page
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                StudentSignUpPage2()), // Add your next sign-up page here
      );
    } else {
      if (_selectedGender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your gender')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Yeneta Tutors"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/img/signup.png', // Replace with your image
                height: 150,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _givenNameController,
                decoration: const InputDecoration(
                  labelText: 'Given Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your given name';
                  } else if (!_alphabetRegex.hasMatch(value)) {
                    return 'Only letters are allowed';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fathersNameController,
                decoration: const InputDecoration(
                  labelText: 'Father\'s Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your father\'s name';
                  } else if (!_alphabetRegex.hasMatch(value)) {
                    return 'Only letters are allowed';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _grandFathersNameController,
                decoration: const InputDecoration(
                  labelText: 'Grand Father\'s Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your grand father\'s name';
                  } else if (!_alphabetRegex.hasMatch(value)) {
                    return 'Only letters are allowed';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: 'Gender',
                ),
                items: ['Male', 'Female']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a gender';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back"),
                  ),
                  ElevatedButton(
                    onPressed: _validateAndProceed,
                    child: const Text("NEXT"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to login page
                },
                child: const Text("Already have an account? Log in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Sign Up Page")),
      body: const Center(
        child: Text("This is the next page of the signup form."),
      ),
    );
  }
}
