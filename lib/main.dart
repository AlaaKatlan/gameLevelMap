import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_levels_scrolling_map/game_levels_scrolling_map.dart';
import 'package:game_levels_scrolling_map/model/point_model.dart';
import 'package:lottie/lottie.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

List<PointModel> points = [];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapVerticalExample(),
      //home: MapVerticalExample(),
    );
  }
}

class MapVerticalExample extends StatefulWidget {
  const MapVerticalExample({Key? key}) : super(key: key);

  @override
  State<MapVerticalExample> createState() => _MapVerticalExampleState();
}

class _MapVerticalExampleState extends State<MapVerticalExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          child: GameLevelsScrollingMap.scrollable(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        imageHeight: MediaQuery.of(context).size.height,
        imageWidth: MediaQuery.of(context).size.width,
        imageUrl: "assets/drawable/gameleve.jpg",
        direction: Axis.vertical,
        reverseScrolling: true,
        pointsPositionDeltaX: 40,
        pointsPositionDeltaY: 30,
        svgUrl: 'assets/svg/ponit-01.svg',
        points: points,
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    fillTestData();
  }

  List<PointModel> points = [];

  void fillTestData() {
    for (int i = 0; i < 30; i++) {
      points.add(PointModel(100, testWidget(i)));
    }
  }

  Widget testWidget(int order) {
    return InkWell(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset('assets/drawable/LottieLogo2.json', width: 50),
          Text("$order",
              style: const TextStyle(color: Colors.white, fontSize: 15))
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("Point $order"),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
