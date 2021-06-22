import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main.dart';

class SimplePage extends StatelessWidget {
  final Color color;

  const SimplePage({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  final state =
                      context.findAncestorStateOfType<MyHomePageState>();
                  state?.pushRandomPage();
                },
                child: const Text('Push'),
              ),
              TextButton(
                onPressed: () {
                  final state =
                      context.findAncestorStateOfType<MyHomePageState>();
                  state?.pop();
                },
                child: const Text('Pop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
