import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_screen_task/main.dart';

import 'home.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://media.macphun.com/img/uploads/customer/blog/1541780181/15417810945be5b666c4ab71.02915742.jpg?q=85&w=1680'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 50,
                      right: 8.0,
                      bottom: 20,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        icon: Icon(
                          Icons.person,
                          color: Colors.teal,
                        ),
                        hintText: 'Enter Your Name',
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        icon: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        hintText: 'Enter a Phone Number',
                        labelText: 'phone',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.teal,
                        ),
                        hintText: 'Enter your data of birth',
                        labelText: 'Data Of Birth',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.only(left: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.teal, Colors.tealAccent])),
                      child: TextButton(
                        child: const Text(
                          "Sign up",
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
