import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/constants.dart';
import 'package:iti_project/screens/about_app_screen.dart';
import 'package:iti_project/screens/bottom%20nav%20bar/categories_screen.dart';
import 'package:iti_project/screens/bottom%20nav%20bar/home_screen.dart';
import 'package:iti_project/screens/bottom%20nav%20bar/personal_screen.dart';
import 'package:iti_project/screens/developer_screen.dart';
import 'package:iti_project/screens/signin_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const PersonalScreen(),
  ];
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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text("About application"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AboutApplicationScreen();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.developer_mode_rounded),
              title: const Text("About Developers"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const DeveloperScreen();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sign Out"),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return const SignInScreen();
                }), (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: SizedBox(
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Divider(
              color: Colors.white,
            ),
            BottomNavigationBar(
              backgroundColor: kPrimaryColor,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.white,
              selectedIconTheme: const IconThemeData(color: Colors.blue),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: "Categories",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Personal",
                ),
              ],
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
