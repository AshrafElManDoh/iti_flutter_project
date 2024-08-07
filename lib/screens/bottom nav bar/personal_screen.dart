import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/constants.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});
  getUserFunction() {
    User? user = FirebaseAuth.instance.currentUser;

    (String? userId, String? userEmail, String ifNull) record =
        (user!.uid, user.email, "Null");

    return record;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(
                Icons.person,
                size: 100,
                color: kPrimaryColor,
              )),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            const Text(
              "E-Mail : ",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Expanded(
              child: Text(
                getUserFunction().$2 ?? getUserFunction().$3,
                style: const TextStyle(fontSize: 25, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            const Text(
              "UID : ",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Expanded(
              child: Text(
                getUserFunction().$1 ?? getUserFunction().$3,
                style: const TextStyle(fontSize: 25, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            )
          ],
        ),
      ],
    );
  }
}
