import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../post_related/post_card.dart';
import '../profile/drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 224, 229, 1),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(224,238,226,1),
        foregroundColor: const Color.fromRGBO(83,46,59, 1),
      ),
      drawer: Drawerr(name: curr[0],),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Random random = new Random();
                  int randomNumber = random.nextInt(posts.length);
                  Map<String, String> post = posts[randomNumber];
                  String name = post['name'] as String;
                  String username = post['username'] as String;
                  String text = post['text'] as String;
                    return PostCard(name: name, username: username, text: text);
                }),
          ),
        ],
      ),
    );
  }
}
