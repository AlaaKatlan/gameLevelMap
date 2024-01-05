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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameLevel(),
    );
  }
}

class GameLevel extends StatefulWidget {
  const GameLevel({super.key});

  @override
  State<GameLevel> createState() => _GameLevelState();
}

class _GameLevelState extends State<GameLevel> {
  final GlobalKey myKey = GlobalKey();
  Size contSize = const Size(10, 10);
  Offset conOfffset = const Offset(0, 0);
  getSizes() {
    final RenderBox renderBox =
        myKey.currentContext!.findRenderObject() as RenderBox;
    contSize = renderBox.size;
    print("SIZE of Red: $contSize");

    final RenderBox renderBoxRed =
        myKey.currentContext!.findRenderObject() as RenderBox;
    final conOfffset = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of Red: $conOfffset ");
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);

    super.initState();
  }

  _afterLayout(_) {
    getSizes();
  }

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
                SizedBox(
                  // color: Colors.red,
                  height: screenSize.height,
                  // width: double.maxFinite,
                  key: myKey,
                  child: Image.asset(
                    'assets/drawable/island.png',
                    height: screenSize.height,
                    fit: BoxFit.contain,
                    width: screenSize.height * 0.5,
                  ),
                ),
                Positioned(
                  left: contSize.width * 0.43,
                  top: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Lottie.asset('assets/drawable/LottieLogo2.json',
                          width: 100, fit: BoxFit.cover),
                      const Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: contSize.width * 0.2,
                  top: contSize.height * 0.3,
                  child: Lottie.asset('assets/drawable/LottieLogo2.json',
                      width: 100, fit: BoxFit.contain),
                ),
                Positioned(
                  left: contSize.width * 0.1,
                  top: contSize.height * 0.55,
                  child: Lottie.asset('assets/drawable/LottieLogo2.json',
                      width: 100, fit: BoxFit.contain),
                ),
                Positioned(
                  left: contSize.width * 0.7,
                  top: contSize.height * 0.7,
                  child: Lottie.asset('assets/drawable/LottieLogo2.json',
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
