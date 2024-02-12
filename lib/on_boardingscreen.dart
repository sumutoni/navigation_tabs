import 'package:flutter/material.dart';
import 'package:navigation_tabs/Intro_screens/screen1.dart';
import 'package:navigation_tabs/Intro_screens/screen2.dart';
import 'package:navigation_tabs/Intro_screens/screen3.dart';
import 'package:navigation_tabs/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  //keep track of page
  PageController _controller = PageController();
  bool checkLastPage = false;
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        PageView(
          controller: _controller,
          onPageChanged: (index){
              setState(() {
                checkLastPage = (index == 2);
                pageIndex = index;
              });
          } ,
          children: const [
            Board1(),
            Board2(),
            Board3()
          ],
        ),
        Positioned(
          top: 40.0,
          right: 10.0,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Home();
              }));
            },
            
            child: 
            (pageIndex == 0)?
            const Text('Skip', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.none),):
            const Text('Skip', style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 80, 13, 97), fontWeight: FontWeight.bold, decoration: TextDecoration.none),)
          ),
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //skip button
              GestureDetector(
                onTap: (){
                  _controller.jumpToPage(pageIndex - 1);
                },
                child:
                (pageIndex == 0)?
                const Text('', style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold, decoration: TextDecoration.none),):
                const Text('prev', style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold, decoration: TextDecoration.none),)
              ),
              SmoothPageIndicator(
                controller: _controller, 
                count: 3,
                effect: const SwapEffect(
                  activeDotColor: Colors.deepPurple,
                  dotColor: Color.fromARGB(255, 163, 93, 175),
                  spacing: 20.0
                ),
              ),
              //next or done button
              checkLastPage?
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const Home();
                  }));
                },
                child: const Text('done',style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,decoration: TextDecoration.none))
              ):
              GestureDetector(
                onTap: (){
                  _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                },
                child: const Text('Next',style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,decoration: TextDecoration.none))
              ),
            ],
          ),
        )
      ]
    );
  }
}