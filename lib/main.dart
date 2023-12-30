import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameLevel(),
    );
  }
}

class GameLevel extends StatelessWidget {
  GameLevel({super.key});
  final GlobalKey myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/drawable/mem-bg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: [
                Container(
                  color: Colors.red,
                  key: myKey,
                  child: Image.asset('assets/drawable/island.png'),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Lottie.asset('assets/drawable/LottieLogo1.json',
                      width: 100, fit: BoxFit.contain),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Lottie.asset('assets/drawable/LottieLogo1.json',
                      width: 100, fit: BoxFit.contain),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
