import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  Page1({super.key});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController fristNameCon = TextEditingController();
  final TextEditingController lastNameCon = TextEditingController();
  final TextEditingController phoneNoCon = TextEditingController();
  final TextEditingController addressCon = TextEditingController();
  bool _obscureText = true; // For toggling password visibility

  @override
  Widget build(BuildContext context) {
    // Email validation regular expression
    final RegExp rgex = RegExp('[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.(ac.uk)');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: fristNameCon,
                validator: (String? txt) {
                  if (txt == null || txt.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Enter your First Name',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: lastNameCon,
                validator: (String? txt) {
                  if (txt == null || txt.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Enter your Last Name',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailCon,
                validator: (String? txt) {
                  if (txt == null || txt.isEmpty) {
                    return 'This field is required';
                  } else if (rgex.hasMatch(txt) == false)
                    return 'Invalid email';
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Enter your Email',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              // Password Field with Obscure Text Toggle
              TextFormField(
                controller: passwordCon,
                obscureText: _obscureText, // This controls the text visibility
                validator: (String? txt) {
                  if (txt == null || txt.isEmpty) {
                    return 'This field is required';
                  } else if (txt.length < 6)
                    return 'Password must be greater than 6 characters';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Enter your Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText =
                            !_obscureText; // Toggle password visibility
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: phoneNoCon,
                validator: (String? txt) {
                  if (txt == null || txt.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Enter your Phone No',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: addressCon,
                validator: (String? txt) {
                  if (txt == null || txt.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Enter your Address',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (formKey.currentState!.validate() == false) {
      return;
    }
    print('\nemail = ${emailCon.text}\npassword = ${passwordCon.text}');
  }
}
