import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';

class VerifiedScreen extends StatefulWidget {
  final String number;
  final String otp;
  final String user;
  const VerifiedScreen(
      {Key? key, required this.number, required this.otp, required this.user})
      : super(key: key);

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> log_info;

  @override
  void initState() {
    super.initState();
  }

  String ot1 = "";
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            OtpTextField(
              numberOfFields: 6,
              showFieldAsBox: true,
              enabledBorderColor: Color.fromARGB(255, 155, 155, 155),
              filled: true,
              fieldWidth: 50,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              onSubmit: (String verificationCode) {
                ot1 = verificationCode;
              },
            ),
            SizedBox(
              height: 45,
            ),
            ElevatedButton(
                onPressed: () async {
                  print(ot1);
                  if (ot1 == widget.otp) {
                    final SharedPreferences pref = await _prefs;
                    pref.setBool("loggedInfo", true);
                    if (widget.user != null) {
                      pref.setString("user", widget.user);
                    }
                    Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                  }
                },
                child: Text("Verify"))
          ],
        ),
      ),
    );
  }
}
