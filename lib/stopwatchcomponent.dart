import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchComponent extends StatefulWidget {
  const StopWatchComponent({super.key});

  @override
  State<StopWatchComponent> createState() => _StopWatchComponentState();
}

class _StopWatchComponentState extends State<StopWatchComponent> {
  int counter = 0;
  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  void onTick(Timer timer) {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter.toString() + ' seconds',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
