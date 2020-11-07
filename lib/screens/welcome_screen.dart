import 'package:dominanti_planetarie/screens/input_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<void> delayMethod() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => InputScreen()), (route) => false);
  }

  @override
  void initState() {
    delayMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to [APPNAME]",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff39A3FA),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.amber,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
