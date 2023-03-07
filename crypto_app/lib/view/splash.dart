import 'package:flutter/material.dart';

import 'nav_bar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static String id = 'Splash page';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: myHeight,
          width: myWidth,
          child: Column(
            children: [
              Image.asset('assets/image/1.gif'),
              Column(
                children: const [
                  Text(
                    'The Future',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Learn more about cryptocurrency, Look to',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'the Future in Binance',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: myHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.14),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, NavBarPage.id),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffbc700),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: myWidth * 0.05,
                          vertical: myHeight * 0.013),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Join Now!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                            RotationTransition(
                              turns: AlwaysStoppedAnimation(310 / 360),
                              child: Icon(Icons.arrow_forward_rounded),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
