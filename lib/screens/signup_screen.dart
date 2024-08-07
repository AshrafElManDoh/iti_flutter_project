import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  bool isVisible = true;

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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    final bool emailValid = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "E-mail must not be empty";
                    }
                    if (emailValid == false) {
                      return "Invalid email format!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "E-Mail",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: isVisible,
                  controller: passController,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password is too short !";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.password),
                    prefixIconColor: Colors.white,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    suffixIconColor: Colors.white,
                    border: const OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Signed up successfully")));

                              Navigator.pop(context);
                            });
                          } on Exception catch (e) {
                            log(e.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("There is an error!")));
                          }
                        }
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you hava an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Sign In!",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
