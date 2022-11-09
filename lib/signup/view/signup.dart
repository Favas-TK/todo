import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/login/login.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const ListTile(
                title: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.blue,
                  ),
                ),
                subtitle: Text(
                  'please enter details to register',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: mailController,
                  decoration: const InputDecoration(
                    labelText: 'enter your mail',
                    hintText: 'mail',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: mobileController,
                  decoration: const InputDecoration(
                    labelText: 'mobile number',
                    hintText: 'Mobile',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: cPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'confirm password',
                    hintText: 'confirm',
                  ),
                ),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: const Text('Register'),
                onPressed: () {
                  createuser(
                    mailController.text,
                    passwordController.text,
                    nameController.text,
                    mobileController.text,
                    context,
                  );
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                child: const Text('already have an account? Login'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> createuser(
    String email,
    String password,
    String username,
    String phonenumber,
    BuildContext context,
  ) async {
    final auth = FirebaseAuth.instance;
    final userRef = FirebaseFirestore.instance.collection('users');
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userRef.add({
        'userid': auth.currentUser!.uid,
        'userName': username,
        'email': email,
        'password': password,
        'profileImage': '',
        'phonenumber': phonenumber,
      });
      unawaited(
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.code),
        ),
      );
    }
  }
}
