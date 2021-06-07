import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  // Future<DocumentSnapshot> getData() async {
  //   await Firebase.initializeApp();
  //   return await FirebaseFirestore.instance
  //       .collection('chats/x5FRKSynZC0ExwIcicd3/messages')
  //       .doc("docID")
  //       .get();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('chats/x5FRKSynZC0ExwIcicd3/messages')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          int length = 0;
          if (snapshot.hasError || !snapshot.hasData) {
            length = 0;
          }
          if (snapshot.data != null) {
            length = snapshot.data.docs.length;
            return ListView.builder(
              itemCount: length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(8),
                child: Text('This Works'),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('chats/x5FRKSynZC0ExwIcicd3/messages')
      //       .snapshots(),
      //   builder: (context, streamSnapshot) {
      //     if (streamSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     return ListView.builder(
      //       itemCount:
      //           streamSnapshot.hasData ? streamSnapshot.data.docs.length : 0,
      //       itemBuilder: (context, index) => Container(
      //         padding: EdgeInsets.all(8),
      //         child: Text('This Works'),
      //       ),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
