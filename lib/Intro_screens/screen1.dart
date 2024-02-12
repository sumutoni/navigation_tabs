import 'package:flutter/material.dart';

class Board1 extends StatelessWidget {
  const Board1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 156, 51, 165),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          const Center(
            child: Text('WELCOME TO HOMIEO', style: TextStyle(fontFamily: 'Comfortaa', fontSize: 30.0, color: Colors.white, decoration: TextDecoration.none),)
          ),
          const SizedBox(height: 60),
          
          Image.asset('assets/images/chat.png',),
          const SizedBox(height: 20),
          const Center(
            child: Text('Chat with Friends!', style: TextStyle(fontFamily: 'Comfortaa', fontSize: 30.0, color: Colors.white, decoration: TextDecoration.none),)
          ),
        ],
      )
    );
  }
}