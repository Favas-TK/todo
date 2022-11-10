import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:uuid/uuid.dart';

class ModalTextField extends StatelessWidget {
  ModalTextField({
    Key? key,
  }) : super(key: key);
  TextEditingController todoNameController = TextEditingController();
  TextEditingController todoDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        margin: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              'Add todo',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              controller: todoNameController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 217, 212, 212),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Enter todo here',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              controller: todoDescriptionController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 217, 212, 212),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Enter todo description.....',
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textColor: Colors.white,
              color: Colors.blue,
              child: const Text('Save'),
              onPressed: () {
                createTodo(
                  todoName: todoNameController.text,
                  description: todoDescriptionController.text,
                );
                MotionToast(
                  icon: Icons.done,
                  primaryColor: Colors.green,
                  description: const Text(' successfully saved'),
                ).show(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> createTodo({
    required String todoName,
    required String description,
  }) async {
    final todoRef = FirebaseFirestore.instance.collection('todo data');
    final auth = FirebaseAuth.instance;
    final userid = auth.currentUser!.uid;
    const uuid = Uuid();
    final todoId = uuid.v4();
    final date = DateFormat.yMd().add_jm();
    try {
      await todoRef.doc(todoId).set({
        'todoName': todoName,
        'description': description,
        'userid': userid,
        'todoid': todoId,
        'date': date,
      });
    } catch (e) {}
  }
}
