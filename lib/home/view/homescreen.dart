import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/homescreen.dart';
import 'package:todo/profile/view/profile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  CollectionReference todoRef =
      FirebaseFirestore.instance.collection('todo data');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my_todo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: todoRef
            .where('userid', isEqualTo: _auth.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
           // print(snapshot.data!.docs);
            final todoitems = snapshot.data!.docs;
            //print(todoitems[1]['todoName']);
            return ListView.builder(
              itemCount: todoitems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(todoitems[index]['todoName'].toString()),
                  subtitle: Text(todoitems[index]['description'].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => ModalTextField(
                              // buttonName: 'Update',
                              buttonType: false,
                              name: todoitems[index]['todoName'].toString(),
                              description:
                                  todoitems[index]['description'].toString(),
                              todoid: todoitems[index]['todoid'].toString(),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteTodo(todoitems[index]['todoid'].toString());
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return ModalTextField(
                // buttonName: 'Save',
                buttonType: true,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> deleteTodo( String id ) async {
    final todoref = FirebaseFirestore.instance.collection('todo data');
    try {
      await todoRef.doc(id).delete();
    } catch (e) {}
  }
}
