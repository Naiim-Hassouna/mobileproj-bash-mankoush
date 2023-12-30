import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    final String username = usernameController.text.trim();
    final String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Please fill in all fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('https://bash-mankoush.000webhostapp.com/login.php'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['success']) {
        // Login successful, navigate to the home screen or perform any other actions
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Login failed, display an error message
        final String errorMessage = data['message'];
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Handle server error
      print('Server error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: const Color.fromRGBO(247, 205, 120, 100),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME BACK!',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 35.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.brown),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.brown),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                loginUser(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.all(12.0),
              ),
              child: Text('Login', style: TextStyle(fontSize: 16.0)),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/register");
              },
              child: Text(
                'Don\'t have an account? Register here',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
