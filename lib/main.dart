import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen/views/screens/secound_page.dart';
import 'package:splash_screen/views/screens/welcome_page.dart';
import 'package:splash_screen/views/utils/sf_utils.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
    ),
    debugShowCheckedModeBanner: false,
    home: const FirstPage(),
  ));
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool LoggedIn = false;

  checkLogin() async {
    setState(() {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoggedIn = prefs.getBool(sfLogIn) ?? false;
    if (LoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    }
  }

  LogIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // LoggedIn = true;
    prefs.setBool(sfLogIn, LoggedIn);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SecondPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset("assets/images/1.jpg"),
          ),
          const Text(
            "    Search How-To's Help Videos, and \n  Solutions to quickly troubleshoot and \n                enhance performance.",
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  LoggedIn = true;
                  prefs.setBool(sfLogIn, LoggedIn);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
                width: 90,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade900,
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade200,
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade200,
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade200,
                      ),
                    ),
                  ],
                )),
              ),
              GestureDetector(
                onTap: () {
                  LogIn();
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
