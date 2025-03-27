import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class MyMessageScreen extends StatefulWidget {
  DocumentSnapshot<Object?> snapshot;

  MyMessageScreen({super.key, required this.snapshot});

  @override
  State<MyMessageScreen> createState() => _MyMessageScreenState();
}

class _MyMessageScreenState extends State<MyMessageScreen> {
  TextEditingController _msgController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("---->>> receiver ::: ${widget.snapshot.id}");
    print(
        "----->>> current logged in user :: ${FirebaseAuth.instance.currentUser!.uid}");
  }

  String formateTimeStamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat.jm().format(dateTime);
    String formattedDate = DateFormat.yMMMd().format(dateTime);

    return "${formattedDate} at ${formattedTime}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.deepPurple[200],
        title: Row(
          children: [
            CircleAvatar(
              child: Image.network("${widget.snapshot["profilePic"]}"),
            ),
            SizedBox(
              width: 30,
            ),
            Text("${widget.snapshot["username"]}")
          ],
        ),
      ),
      body: Column(
        children: [

          //Here the body part of the message show...
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Chat")
                .where("receiver",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .where("sender", isEqualTo: widget.snapshot.id)
                .orderBy("timestamp")
                .snapshots(),
            builder: (context, senderSnapshot) {
              if (senderSnapshot.hasData) {
                var senderMessgae = senderSnapshot.data!.docs;
                return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Chat")
                      .where("sender",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .where("receiver", isEqualTo: widget.snapshot.id)
                      .orderBy("timestamp")
                      .snapshots(),
                  builder: (context, receiverSnapshot) {
                    if (receiverSnapshot.hasData) {
                      var receiverMessage = receiverSnapshot.data!.docs;
                      var allMessages = [...senderMessgae, ...receiverMessage];
                      allMessages.sort((a, b) => (a["timestamp"] as Timestamp)
                          .compareTo(b["timestamp"] as Timestamp));

                      return ListView.builder(
                          itemCount: allMessages.length,
                          itemBuilder: (context, index) {
                            var message = allMessages[index];
                            String senderID = message["sender"];
                            bool isCurrentUserIsSender = senderID ==
                                FirebaseAuth.instance.currentUser!.uid;

                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: isCurrentUserIsSender
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  if (!isCurrentUserIsSender)
                                    CircleAvatar(
                                      child: Text(
                                          "${widget.snapshot["username"][0]}"),
                                    )
                                  else
                                    SizedBox(
                                      width: 32,
                                    ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      color: isCurrentUserIsSender
                                          ? Colors.blue[200]
                                          : Colors.purple[200],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${message["message"]}",
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          });
                    } else if (receiverSnapshot.hasError) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),

          //Here the messageBox to send the message*/

          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                  controller: _msgController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Type message here..",
                    hintStyle: TextStyle(fontSize: 16),
                  ),
                  style: TextStyle(color: Colors.teal),
                )),
                IconButton(
                  onPressed: () {
                    String? msg = _msgController.text.toString();
                    if (msg.isNotEmpty) {
                      FirebaseFirestore.instance.collection("Chat").add({
                        "sender": FirebaseAuth.instance.currentUser!.uid,
                        "receiver": widget.snapshot.id,
                        "message": msg,
                        "timestamp": DateTime.now()
                      });
                    }
                    _msgController.clear();
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
