import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:login_screen_task/signup.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Task',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: const Icon(Icons.icecream),
          actions: const [Icon(Icons.star)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/40517723?v=4"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  // margin: EdgeInsets.only(left: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.teal, Colors.tealAccent])),
                  child: TextButton(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                      text: 'don\'t have an account? ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(
                              color: Colors.teal,
                              fontSize: 15,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MyForm(),
                                    ));
                              })
                      ]),
                ),
              )
            ],
          ),
        ));
  }
}
