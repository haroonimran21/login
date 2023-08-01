import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/models/utillls.dart';
import 'package:login/pages/verify_code.dart';
import 'package:login/widgets/round_button.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Phone"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
              decoration: InputDecoration(helperText: "+1 356 5678 765"),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: "Login",
                onTap: () {
                  auth.verifyPhoneNumber(
                      phoneNumber: phoneNumberController.text,
                      verificationCompleted: (_) {},
                      verificationFailed: (e) {
                        Utills().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCode(
                                    verificationId: verificationId)));
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utills().toastMessage(e.toString());
                      });
                })
          ],
        ),
      ),
    );
  }
}
