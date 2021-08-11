import 'package:flutter/material.dart';
import 'package:shopping_bloc_app/screens/home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Shoe Shop',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: 'textHero',
              child: Text(
                'Shop your kicks now',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(20.0)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 2.0),
                    Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.not_started),
                    SizedBox(width: 2.0),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
