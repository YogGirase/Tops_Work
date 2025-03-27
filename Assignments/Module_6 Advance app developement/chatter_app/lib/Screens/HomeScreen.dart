import 'package:chatter_app/Screens/MessageScreen.dart';
import 'package:chatter_app/Screens/ProfileScreen.dart';
import 'package:chatter_app/Screens/SIGNIN_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  User? user;

  MyHomeScreen({super.key, required this.user});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String? username;
  TextEditingController _searchController = TextEditingController();

  List<DocumentSnapshot>? allUsers;
  List<DocumentSnapshot>? filteredUsers;

  Future<void> getUserRecord() async {
    var document = await FirebaseFirestore.instance
        .collection("Person")
        .doc(widget.user!.uid)
        .get();

    setState(() {
      username = document["username"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserRecord();
  }

  void searchData(String keyword) {
    setState(
      () {
        if (keyword.isEmpty) {
          filteredUsers = allUsers;
        } else {
          filteredUsers = allUsers!
              .where((user) => user["username"]
                  .toLowerCase()
                  .contains(keyword.toLowerCase()))
              .toList();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade200,
        title: Text(
          "Welcome ${username}!",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 20,
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (value) {
              if (value == "Profile") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ));
              } else if (value == "Logout") {
                FirebaseAuth.instance.signOut();

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySignInScreen(),
                    ));
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Profile"),
                  value: "Profile",
                ),
                PopupMenuItem(
                  child: Text("Logout"),
                  value: "Logout",
                ),
              ];
            },
            color: Colors.blueAccent,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (value) {
                    searchData(value);
                  },
                  controller: _searchController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search Here",
                      labelText: "Search"),
                ),
              )),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Person").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  allUsers = snapshot.data!.docs
                      .where((element) => element.id != widget.user!.uid)
                      .toList();

                  filteredUsers ??= List.from(allUsers!);

                  return ListView.builder(
                    itemCount: filteredUsers!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyMessageScreen(
                                      snapshot: filteredUsers![index]),
                                ));
                          },
                          child: Card(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Image.network(
                                      "${filteredUsers![index]["profilePic"]}"),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text("${filteredUsers![index]["username"]}")
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
