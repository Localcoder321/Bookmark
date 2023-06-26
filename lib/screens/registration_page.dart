import 'package:bookmark_uz/screens/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;

  String? nameValidationText;
  String? emailValidationText;
  String? passwordValidationText;
  String? reEnterValidationText;

  String name = "";
  String email = "";
  String password = "";
  bool isReEnterTrue = false;

  bool get isAllInputsAreValid =>
      name.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          isReEnterTrue;

  void validateName(String value) {
    if (value.length < 2) {
      setState(() {
        nameValidationText = "Invalid name";
      });
      return;
    }

    setState(() {
      nameValidationText = null;
      name = value;
    });
  }

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

  void validateReEnter(String value) {
    if (password != value) {
      setState(() {
        reEnterValidationText = "Password doesn't match";
      });

      return;
    }

    setState(() {
      reEnterValidationText = null;
      isReEnterTrue = true;
    });
  }

  void openLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void openHomePage() {
    if (isAllInputsAreValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

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
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Full name",
                    labelStyle: const TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter full name",
                    hintStyle: const TextStyle(fontFamily: "Raleway"),
                    errorText: nameValidationText,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: const Image(
                      image: AssetImage("assets/images/person.png"),
                    ),
                  ),
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
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  obscureText: !_isRepeatPasswordVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(fontFamily: "Raleway"),
                    hintText: "Enter password",
                    hintStyle: const TextStyle(fontFamily: "Raleway"),
                    errorText: reEnterValidationText,
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