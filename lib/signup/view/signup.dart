import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const ListTile(
      
                title: Text('Register',
                style: TextStyle(fontSize: 50,
                color: Colors.blue,),),
                
                subtitle: Text('please enter details to register',
                style: TextStyle(fontSize: 20,
                color: Colors.blue,),),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'enter your mail',
                    hintText: 'mail',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'mobile number',
                    hintText: 'Mobile',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'confirm password',
                    hintText: 'confirm',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'enter your mail',
                    hintText: 'mail',
                  ),
                ),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: const Text('Register'),
                onPressed: () {},
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {

                },
                child: const Text('already have an account? Login'),
              )
            ],
          );
        },
      ),
    );
  }
}


   
