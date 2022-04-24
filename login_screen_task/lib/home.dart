import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gmail Clone'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: Column(children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Siddig A.Hamoda",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            accountEmail: Text("noory4433@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/40517723?v=4'),
            ),
          ),
          ListTile(
            title: Text("Sent"),
            leading: Icon(Icons.send),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text("inbox"),
            leading: Icon(Icons.inbox),
          ),
          ListTile(
            title: Text("Started"),
            leading: Icon(Icons.star),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text("chat"),
            leading: Icon(Icons.chat),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text("Archive"),
            leading: Icon(Icons.archive),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text("Log out"),
            leading: Icon(Icons.logout),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}
