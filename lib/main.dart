import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        duration: Duration(seconds: 3),
        navigateAfterDuration:
            HomeScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final Duration duration;
  final Widget navigateAfterDuration;

  const SplashScreen({
    super.key,
    required this.duration,
    required this.navigateAfterDuration,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.navigateAfterDuration),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color(0xff3d4eed),
            child: const Center(
              child: Image(
                image: AssetImage("assets/images/logo2.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 150, bottom: 400),
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 13),
                  child: SizedBox(
                    height: 65,
                    width: 340,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xff3d4eed),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        "Log into account",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 65,
                  width: 340,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                      Colors.white,
                    )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationPage()));
                    },
                    child: const Text(
                      "Create an account",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 15, right: 120),
                child: Text(
                  "Log into account",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 100, bottom: 40),
                child: Text(
                  "Get back to your reading list.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    labelStyle: TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter full email address",
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: Image(
                      image: AssetImage("assets/images/sms.png"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  obscureText: !_isPasswordVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter password",
                    hintStyle: const TextStyle(fontFamily: "Raleway"),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: const Image(
                      image: AssetImage("assets/images/lock.png"),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible?Icons.visibility_outlined:Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 85),
                child: SizedBox(
                  height: 65,
                  width: 340,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xff3D4EED),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login2(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Raleway",
                  ),
                  children: [
                    const TextSpan(text: "New here? "),
                    TextSpan(
                      text: "Create an account",
                      style: const TextStyle(
                        color: Color(0xff3d4eed),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;
  final bool _isPasswordMismatch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 15, right: 100),
                child: Text(
                  "Create an account",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 75, bottom: 40),
                child: Text(
                  "Start your book journey with us.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Full name",
                    labelStyle: TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter full name",
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: Image(
                      image: AssetImage("assets/images/person.png"),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    labelStyle: TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter full email address",
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: Image(
                      image: AssetImage("assets/images/sms.png"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  obscureText: !_isPasswordVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter password",
                    hintStyle: const TextStyle(fontFamily: "Raleway"),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: const Image(
                      image: AssetImage("assets/images/lock.png"),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible?Icons.visibility_outlined:Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  obscureText: !_isRepeatPasswordVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter password",
                    hintStyle: const TextStyle(fontFamily: "Raleway"),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: const Image(
                      image: AssetImage("assets/images/lock.png"),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isRepeatPasswordVisible = !_isRepeatPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isRepeatPasswordVisible?Icons.visibility_outlined:Icons.visibility_off_outlined,
                      ),
                    ),
                    errorText: _isPasswordMismatch ? "Passwords do not match" : null,
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 85),
                child: SizedBox(
                  height: 65,
                  width: 340,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xff3D4EED),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Registration2(),
                        ),
                      );
                    },
                    child: const Text(
                      "Create account",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Raleway",
                  ),
                  children: [
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Log in",
                      style: const TextStyle(
                        color: Color(0xff3d4eed),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Login2 extends StatelessWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Color(0xff3D4EED),
          )),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Successfully logged in",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class Registration2 extends StatelessWidget {
  const Registration2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Color(0xff3D4EED),
          )),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Created a new account",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
