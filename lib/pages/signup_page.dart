import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/models/utillls.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/widgets/round_button.dart';

class SignUPPage extends StatefulWidget {
  const SignUPPage({super.key});

  @override
  State<SignUPPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUPPage> {
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp() {
    {
      setState(() {
        loading = true;
      });
      _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        setState(() {
          loading = false;
        });
      }).onError((error, stackTrace) {
        Utills().toastMessage(error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(child: Text("SignUP")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_open)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      }),
                ],
              ),
            ),
            SizedBox(height: 50),
            RoundButton(
              title: "Sign Up",
              loading: loading,
              onTap: () {
                if (_formKey.currentState!.validate()) signUp();
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already hve an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
