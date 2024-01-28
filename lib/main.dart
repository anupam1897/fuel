import 'package:feul/services/splash_screen.dart';
import 'package:feul/services/theme_provider.dart';
import 'package:feul/views/home.dart';
import 'package:feul/views/hub.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AppMainPage(),
      home: AppMainPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 0)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AppMainPage();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}

class AppMainPage extends StatefulWidget {
  @override
  _AppMainPageState createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Hub(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black.withOpacity(.80),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'hub',
            icon: Icon(Icons.hub_outlined),
          ),
          // BottomNavigationBarItem(
          //   label: 'Chat',
          //   icon: Icon(Icons.chat_bubble_outline),
          // ),
          // BottomNavigationBarItem(
          //   label: 'Deals',
          //   icon: Icon(Icons.local_offer_outlined),
          // ),
          // BottomNavigationBarItem(
          //   label: 'Account',
          //   icon: Icon(Icons.account_circle_outlined),
          // ),
        ],
      ),
    );
  }
}
