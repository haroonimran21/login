import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _errorMessage = '';

  bool _isLogin = true;
  bool _isForgotPassword = false;

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
      _errorMessage = '';
    });
  }

  void _toggleForgotPassword() {
    setState(() {
      _isForgotPassword = !_isForgotPassword;
      _errorMessage = '';
    });
  }

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Implement login logic
  }

  void _signup() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Implement signup logic
  }

  void _resetPassword() {
    String email = _emailController.text;

    // Implement reset password logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login/SignUp/forgot Password'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            if (!_isLogin) SizedBox(height: 16.0),
            if (!_isLogin)
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _isLogin ? _login : _signup,
              child: Text(_isLogin ? 'Login' : 'Signup'),
            ),
            if (!_isForgotPassword)
              TextButton(
                onPressed: _toggleForm,
                child: Text(_isLogin
                    ? "Don't have an account? Sign up."
                    : 'Already have an account? Login.'),
              ),
            if (_isForgotPassword)
              TextButton(
                onPressed: _toggleForgotPassword,
                child: Text('Go back to login'),
              ),
            if (!_isLogin && !_isForgotPassword)
              TextButton(
                onPressed: _toggleForgotPassword,
                child: Text('Forgot Password?'),
              ),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
