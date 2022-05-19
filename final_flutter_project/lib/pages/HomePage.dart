import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_web/Custom/TodoCard.dart';
import 'package:firebase_app_web/Service/Auth_Service.dart';
import 'package:firebase_app_web/main.dart';
import 'package:firebase_app_web/pages/AddTodo.dart';
import 'package:firebase_app_web/pages/Profile.dart';
import 'package:firebase_app_web/pages/TaskDetails.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();

  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("Todo").snapshots();
  List<Select> selected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Today's Schedule",
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            SizedBox(
              height: 25,
            ),
          ],
          bottom: PreferredSize(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mondy 21",
                      style: TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        var instance =
                            FirebaseFirestore.instance.collection("Todo");

                        for (var i = 0; i < selected.length; i++) {
                          if (selected[i].checkValue) {
                            instance.doc(selected[i].id).delete();
                            // selected.removeAt(i);
                          }
                        }
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(35),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
                color: Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => AddTodoPage(),
                      ));
                },
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.indigoAccent, Colors.purple],
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => Profile()),
                  );
                },
                child: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
          ],
        ),
        body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  IconData iconData;
                  Color iconColor;
                  Map<String, dynamic> document =
                      snapshot.data.docs[index].data() as Map<String, dynamic>;

                  switch (document["category"]) {
                    case "Work":
                      iconData = Icons.alarm;
                      iconColor = Colors.red;
                      break;
                    case "Workout":
                      iconData = Icons.run_circle_outlined;
                      iconColor = Colors.teal;
                      break;
                    case "Food":
                      iconData = Icons.local_grocery_store;
                      iconColor = Colors.blue;
                      break;
                    case "Study":
                      iconData = Icons.book_online_outlined;
                      iconColor = Colors.grey;
                      break;
                    case "Fun":
                      iconData = Icons.airline_seat_flat_angled_outlined;
                      iconColor = Colors.orange;
                      break;
                    default:
                      iconData = Icons.run_circle_outlined;
                      iconColor = Colors.red;
                  }

                  selected.add(
                    Select(id: snapshot.data.docs[index].id, checkValue: false),
                  );
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => TaskDetails(
                                  document: document,
                                  id: snapshot.data.docs[index].id)));
                    },
                    child: TodoCard(
                      title: document["title"],
                      check: selected[index].checkValue,
                      iconBgColor: Colors.white,
                      iconColor: iconColor,
                      iconData: iconData,
                      time: "10 AM",
                      index: index,
                      onChange: onChange,
                    ),
                  );
                });
          },
        ));
  }

  void onChange(int index) {
    setState(() {
      selected[index].checkValue = !selected[index].checkValue;
    });
  }
}

class Select {
  String id;
  bool checkValue = false;
  Select({this.id, this.checkValue});
}

// IconButton(
//               icon: Icon(Icons.logout),
//               onPressed: () async {
//                 await authClass.signOut();
//                 Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (builder) => MyApp()),
//                     (route) => false);
//               }),
