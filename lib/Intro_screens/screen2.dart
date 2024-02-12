import 'package:flutter/material.dart';

class Board2 extends StatelessWidget {
  const Board2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: 
      const Color.fromARGB(255, 205, 189, 231),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: [
          const SizedBox(height: 200),
          Image.asset('assets/images/share.png',),
          const SizedBox(height: 20),
          const Center(
            child: Text('Share your Hobbies!', style: TextStyle(fontFamily: 'Comfortaa', fontSize: 30.0, color: Color.fromARGB(255, 139, 60, 192), decoration: TextDecoration.none),)
          ),
        ],
      )
    );
  }
}