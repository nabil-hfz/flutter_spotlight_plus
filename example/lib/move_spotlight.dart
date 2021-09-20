import 'package:flutter/material.dart';
import 'package:flutter_spotlight_plus/flutter_spotlight_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotlight Plus Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Spotlight Plus Movable Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset? _center;
  double _radius = 50.0;

  void _onPointerMove(PointerMoveEvent event) {
    setState(() {
      _center = event.position;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _center = event.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - 56;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.amber,
          child: Listener(
            onPointerMove: _onPointerMove,
            onPointerUp: _onPointerUp,
            child: Spotlight(
              center: _center,
              radius: _radius,
              ignoring: false,
              color: Color.fromRGBO(0, 0, 0, 0.95),
              child: Container(
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/lake.jpg',
                        fit: BoxFit.cover,
                        height: height ,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
