import 'package:flutter/material.dart';
import 'package:todo/profile/view/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    builder: (context) => const ProfileScreen(),
                  ),);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: Column(
                    children: [
                      const Text(
                        'Add todo',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      const TextField(
                        decoration: InputDecoration(
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
                      const TextField(
                        decoration: InputDecoration(
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
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
