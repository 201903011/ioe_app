import 'package:flutter/material.dart';
import 'package:ioe_app/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/loginscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckLogin(),
    );
  }
}

class CheckLogin extends StatefulWidget {
  CheckLogin({Key? key}) : super(key: key);

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> log_info;

  bool check = false;

  @override
  void initState() {
    super.initState();
    check_login();
  }

  void check_login() async {
    final SharedPreferences prefs = await _prefs;
    final bool? t1 = prefs.getBool('loggedInfo');
    print("set t1 ${t1}");
    if (t1 == true) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
