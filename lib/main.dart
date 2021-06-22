import 'package:flutter/material.dart';

import 'nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

const _colors = [
  Colors.red,
  Colors.black,
  Colors.blue,
  Colors.green,
];

class MyHomePageState extends State<MyHomePage> {
  final List<Page<dynamic>> _pages = [];

  int _colorIndex = 0;

  @override
  void initState() {
    super.initState();
    pushRandomPage();
  }

  void pushRandomPage() => setState(() {
        final page =
            MaterialPage(child: SimplePage(color: _colors[_colorIndex]));
        _colorIndex++;
        if (_colorIndex == _colors.length) {
          _colorIndex = 0;
        }
        _pages.add(page);
      });

  void pop() => setState(() {
        setState(() {
          if (_pages.length > 1) {
            _pages.removeLast();
          }
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Navigator(
        onPopPage: (router, result) {
          if (_pages.length <= 1) {
            return false;
          }
          pop();
          return true;
        },
        pages: _pages.toList(),
      ),
    );
  }
}
