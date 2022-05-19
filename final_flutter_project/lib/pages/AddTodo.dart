import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  String type = "";
  String category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff1d1e26),
            Color(0xff252041),
          ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create",
                        style: TextStyle(
                          fontSize: 33,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "New Todo",
                        style: TextStyle(
                          fontSize: 33,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      label("Task Title"),
                      SizedBox(
                        height: 12,
                      ),
                      title(),
                      SizedBox(
                        height: 30,
                      ),
                      label("Task Type"),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          typeSelect("important", 0xff2664fa),
                          SizedBox(
                            width: 20,
                          ),
                          typeSelect("planned", 0xff2bc8d9),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      label("Description"),
                      SizedBox(
                        height: 12,
                      ),
                      description(),
                      SizedBox(
                        height: 25,
                      ),
                      label("Category"),
                      SizedBox(
                        height: 12,
                      ),
                      Wrap(
                        runSpacing: 10,
                        children: [
                          catSelect("Food", 0xffff6d6e),
                          SizedBox(
                            width: 20,
                          ),
                          catSelect("Workout", 0xfff29732),
                          SizedBox(
                            width: 20,
                          ),
                          catSelect("Work", 0xff6557ff),
                          SizedBox(
                            width: 20,
                          ),
                          catSelect("Study", 0xff234ebd),
                          SizedBox(
                            width: 20,
                          ),
                          catSelect("Fun", 0xff2bc8d9),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      button(),
                      SizedBox(
                        height: 30,
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return InkWell(
      onTap: () {
        FirebaseFirestore.instance.collection("Todo").add({
          "title": _titleController.text,
          "description": _descController.text,
          "task": type,
          "category": category,
        });
        Navigator.pop(context);
      },
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(0xff8a32f1),
            Color(0xffad32f9),
          ]),
        ),
        child: Center(
            child: Text(
          "Add Todo",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        )),
      ),
    );
  }

  Widget typeSelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          type = label;
        });
      },
      child: Chip(
        backgroundColor: type == label ? Colors.black : Color(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          label,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
      ),
    );
  }

  Widget catSelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          category = label;
        });
      },
      child: Chip(
        backgroundColor: category == label ? Colors.black : Color(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          label,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
      ),
    );
  }

  Widget title() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _titleController,
        style: TextStyle(fontSize: 17, color: Colors.grey),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Task Title",
            hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
            contentPadding: EdgeInsets.only(right: 20, left: 20)),
      ),
    );
  }

  Widget description() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _descController,
        style: TextStyle(fontSize: 17, color: Colors.grey),
        maxLines: null,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Description...",
            hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
            contentPadding: EdgeInsets.only(right: 20, left: 20)),
      ),
    );
  }

  Widget label(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16.5,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
    );
  }
}
