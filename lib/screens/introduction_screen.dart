
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:iti_project/constants.dart';
import 'package:iti_project/screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: kPrimaryColor,
      pages: [
        PageViewModel(
          titleWidget: const Text(
            "Welcome",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),
          ),
          bodyWidget: const Text(
            "Explore our app and find out how it can simplify your daily tasks.",
            style: TextStyle(color: Colors.blueGrey, fontSize: 17),
            textAlign: TextAlign.center,
          ),
          image: Image.asset("assets/images/1.png"),
        ),
        PageViewModel(
            titleWidget: const Text(
              "Easy to use",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            bodyWidget: const Text(
              "Set up your profile and customize it to your liking.",
              style: TextStyle(color: Colors.blueGrey, fontSize: 17),
              textAlign: TextAlign.center,
            ),
            image: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Image.asset(
                "assets/images/2.png",
                color: Colors.white,
                height: 200,
                width: 200,
              ),
            )),
        PageViewModel(
            titleWidget: Padding(
              padding: const EdgeInsets.only(top: 175),
              child: Image.asset(
                "assets/images/3.png",
                color: Colors.white,
              ),
            ),
            body: "")
      ],
      onDone: () => onDone(context),
      showSkipButton: true,
      skip: const Text(
        "Skip",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      done: const Text(
        "Done",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      next: const Icon(
        Icons.forward,
        color: Colors.white,
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10),
        activeSize: const Size(30, 10),
        color: Colors.cyan,
        activeColor: Colors.white,
        spacing: const EdgeInsets.symmetric(horizontal: 3),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

void onDone(context) async {
  final prefs =await SharedPreferences.getInstance();
  await prefs.setBool("IntroScreen",false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const SignInScreen()));
}
