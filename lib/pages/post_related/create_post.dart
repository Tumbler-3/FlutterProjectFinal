import 'package:a_flutter/main.dart';
import 'package:flutter/material.dart';

import '../profile/profile.dart';

class Create extends StatelessWidget {
  final String name;
  final String username;

  Create(
      {super.key, required this.name,
        required this.username,});

  final _formKey = GlobalKey<FormState>();

  late String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(238, 224, 229, 1),
      appBar: AppBar(
        title: Text('New Message'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(224,238,226,1),
        foregroundColor: const Color.fromRGBO(83,46,59, 1),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 130,),
            const Text(
              'Create new message',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(83,46,59, 1),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                fillColor: Colors.grey[300],
                filled: true,
              ),
              validator: (value){
                if (value!.isEmpty) {
                  return "empty";
                }
                text = value;
                Map<String,String> post = {'name': name, 'username': username, 'text': text};
                posts.add(post);
                return null;
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(Color.fromRGBO(224,238,226,1),),
                  foregroundColor: const MaterialStatePropertyAll<Color>(Color.fromRGBO(83,46,59, 1),),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: (){
                if (_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(name: name, username: username)));
                }
              },
              child: const Text(
                'Post',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}