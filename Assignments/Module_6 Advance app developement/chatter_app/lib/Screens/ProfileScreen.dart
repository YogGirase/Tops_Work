
import 'package:chatter_app/Screens/SIGNIN_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user;
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    user = _auth.currentUser; // Get logged-in user
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection("Person").doc(user!.uid).get();

      if (userDoc.exists) {
        setState(() {
          userData = userDoc.data() as Map<String, dynamic>;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: userData!["profilePic"] != null
                    ? NetworkImage(userData!["profilePic"])
                    : AssetImage("assets/default_profile.png") as ImageProvider,
              ),
              SizedBox(height: 20),

              // Username
              Text(
                "${userData!["username"]}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              // Email
              Text(
                " ${userData!["email"]}",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 20),

              // Logout Button
              ElevatedButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                  ;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MySignInScreen(),
                      ));
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/* for image picker*/
  // Future<void> _pickImage() async {
  //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       profilePicUrl = pickedFile.path; // Temporary path, needs Firebase Storage upload
  //     });
  //   }
  // }
