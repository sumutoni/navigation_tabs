import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:navigation_tabs/on_boardingscreen.dart';
import 'Tabs/home_tab.dart';
import 'Tabs/about_tab.dart';
import 'Tabs/calc_tab.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  void navigatePages(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  Widget displayPage(int index){
    if (index == 0){
      return const HomeTab();
    }
    else if(index == 1){
      return const Calculator();
    }
    else{
      return const About();
    }
  }

  Widget drawerItem(int index, String text, IconData icon, bool isSelected){
    return Material(
      color: const Color.fromARGB(0, 9, 36, 78),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left:50.0),
        selected: isSelected,
        selectedTileColor: const Color.fromARGB(146, 27, 11, 85),
        leading: Icon(icon, color: isSelected? Colors.white :const Color.fromARGB(255, 80, 13, 97),),
        title: Text(text, style:  TextStyle(color: isSelected? Colors.white :const Color.fromARGB(255, 80, 13, 97), fontSize: 20.0, fontWeight: FontWeight.bold)),
        onTap: () {
          navigatePages(index);
          Navigator.pop(context);
          
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(193, 13, 14, 92), weight: 30.0),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'H O M I E O',
          style: TextStyle(color: Color.fromARGB(193, 13, 14, 92), fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const OnBoardScreen();
            }));
          }, icon: const Icon(Icons.logout) )
        ],
      ),
      drawer: Drawer(
        
        child: ListView(
          children: [
            const Expanded(
              child: DrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(193, 13, 14, 92)),
                child: Center(
                  child: Text('H O M I E O', style: TextStyle(color: Colors.white, fontSize: 30.0),),
                ),
              ),
            ),
            drawerItem(0, 'H o m e', Icons.home, selectedIndex == 0),
            drawerItem(1, 'C a l c u l a t o r', Icons.calculate_outlined, selectedIndex == 1),
            drawerItem(2, 'A b o u t  m e', Icons.person, selectedIndex == 2),
          ],
          ),
      ),
      body: displayPage(selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color.fromARGB(193, 13, 14, 92),
        backgroundColor: Colors.white,
        index: selectedIndex,
        onTap: navigatePages,
        items: const [
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.calculate, color: Colors.white,),
          Icon(Icons.person, color: Colors.white,),
        ])
    );
  }
}