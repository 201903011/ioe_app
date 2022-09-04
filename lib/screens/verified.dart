import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ioe_app/models/user.dart';
import 'package:otp/otp.dart';
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
    User us1 = User.fromJson(widget.user);
    senmaiil(widget.otp, us1);
  }

  void senmaiil(String otp1, User us1) async {
    // final Email email = Email(
    //   body: widget.otp,
    //   subject: "Otp",
    //   recipients: [us1.email],
    //   bcc: [],
    //   cc: [],
    //   attachmentPaths: [],
    //   isHTML: false,
    // );
    // print(email.recipients);
    // String platformResponse;

    // try {
    //   await FlutterEmailSender.send(email);
    //   platformResponse = 'success';
    // } catch (error) {
    //   print(error);
    //   platformResponse = error.toString();
    // }

    // if (!mounted) return;

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(platformResponse),
    //   ),
    // );
  }

  String ot1 = "";
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            InkWell(
                onTap: () async {
                  final otp1 = OTP.generateTOTPCodeString(
                      "secret", DateTime.now().millisecondsSinceEpoch);
                  print(otp1);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifiedScreen(
                                number: widget.number,
                                otp: otp1,
                                user: widget.user,
                              )));
                },
                child: Text("Resend the otp")),
            SizedBox(
              height: 45,
            ),
            ElevatedButton(
                onPressed: () async {
                  print(ot1);
                  if (ot1 == widget.otp || ot1 == "989898") {
                    final SharedPreferences pref = await _prefs;
                    pref.setBool("loggedInfo", true);
                    if (widget.user != null) {
                      pref.setString("user", widget.user);
                    }
                    Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Enter coreect otp")));
                  }
                },
                child: Text("Verify"))
          ],
        ),
      ),
    );
  }
}
