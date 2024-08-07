import 'package:flutter/material.dart';
import 'package:iti_project/constants.dart';

class AboutApplicationScreen extends StatelessWidget {
  const AboutApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Our",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              "Store",
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        color: kPrimaryColor,
        child: const Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Welcome to our app!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "The main purpose of the application is to learn from the lectures that I attended."
                "This application was created by Flutters Language."
                "This application is used to display some departments and their products."
                "The application may contain some errors, but when we notice them, they will be modified, God willing."
                "Stay up to date with the latest updates and improvements.\n "
                "\n\nContact our support team for any assistance or inquiries on +201021398393\n+201063425755",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
