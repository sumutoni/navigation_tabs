import 'package:flutter/material.dart';

class Board3 extends StatelessWidget {
  const Board3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: [
          const SizedBox(height: 200),
          Image.asset('assets/images/homeo.jpg',),
          const SizedBox(height: 20),
          const Center(
            child: Text('Connect with new people!', style: TextStyle(fontFamily: 'Comfortaa', fontSize: 25.0, color: Color.fromARGB(255, 80, 13, 97), decoration: TextDecoration.none),)
          ),
        ],
      )
    );
  }
}