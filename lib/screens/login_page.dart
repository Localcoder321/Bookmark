import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  String? emailValidationText;
  String? passwordValidationText;

  String email = "";
  String password = "";

  bool get isAllInputsAreValid => email.isNotEmpty && password.isNotEmpty;

  void validateEmail(String value) {
    if (!RegExp(r"^[a-zA-Z][a-zA-Z0-9]*@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$")
        .hasMatch(value)) {
      setState(() {
        emailValidationText = "Invalid email address!";
      });
      return;
    }

    setState(() {
      emailValidationText = null;
      email = value;
    });
  }

  void validatePassword(String value) {
    if (!RegExp(r".{8,}").hasMatch(value)) {
      setState(() {
        passwordValidationText =
        "Password is too short, it must be at least 8 characters";
      });
      return;
    }

    if (value.contains(" ")) {
      setState(() {
        passwordValidationText = "Password shouldn't have space";
      });
      return;
    }

    if (!RegExp(r"\d").hasMatch(value)) {
      setState(() {
        passwordValidationText = "Password must have at least one number";
      });
      return;
    }

    if (!RegExp(r"[a-z]").hasMatch(value)) {
      setState(() {
        passwordValidationText = "Password must have at least one letter";
      });
      return;
    }

    if (!RegExp(r"[A-Z]").hasMatch(value)) {
      setState(() {
        passwordValidationText =
        "Password must have at least one Capital letter";
      });
      return;
    }

    setState(() {
      passwordValidationText = null;
      password = value;
    });
  }

  void openCreateAccountPage() => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const RegistrationPage(),
    ),
  );

  void openHomePage() => isAllInputsAreValid
      ? Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ),
  )
      : null;


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
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    labelStyle: const TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter full email address",
                    hintStyle: const TextStyle(fontFamily: "Raleway"),
                    errorText: emailValidationText,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: const Image(
                      image: AssetImage("assets/images/sms.png"),
                    ),
                  ),
                  onSubmitted: validateEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  obscureText: !_isPasswordVisible,
                  keyboardType: TextInputType.emailAddress,
                  onSubmitted: validatePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter password",
                    hintStyle: const TextStyle(fontFamily: "Raleway"),
                    errorText: passwordValidationText,
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
                padding: const EdgeInsets.only(top: 50, bottom: 85, left: 30, right: 30),
                child: SizedBox(
                  height: 65,
                  width: double.infinity,
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