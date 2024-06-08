
import 'package:flutter/material.dart';
import 'package:mailclient/backend/EmailService.dart';
import 'package:mailclient/home_screen.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final EdgeInsets padding = MediaQuery.of(context).viewInsets;

    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff000000), Color(0xff142b42)],
            stops: [0.1, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             const SizedBox(height: 60),
            Image.asset(
              'assets/white.png',
              width: 90,
              height: 90,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              margin: EdgeInsets.only(bottom: padding.bottom),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: MyForm(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Form widget
class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _authenticateAndNavigate() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final username = _usernameController.text;
    final password = _passwordController.text;

    final emailService = EmailService(
      userName: username,
      password: password,
      domain: 'iitk.ac.in',
      Server: 'qasid.iitk.ac.in', 
      Port: 143,
    );

    try {
      await emailService.loginAndStoreSession(); 
      Navigator.pushReplacement(
     context,
     MaterialPageRoute(
    builder: (context) => EmailListScreen(user: username),
  ),
  );
    } catch (e) {
      setState(() {
        _errorMessage = 'Authentication failed. Please check your credentials.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                 focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
                labelText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                 focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: _isLoading ? null : _authenticateAndNavigate, // Disable button when loading
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                  : const Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ),
          if (_errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
