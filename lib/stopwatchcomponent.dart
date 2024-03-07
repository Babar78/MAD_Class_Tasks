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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    timer.cancel();
                    timer = Timer.periodic(const Duration(seconds: 1), onTick);
                  },
                  child: const Text('Start'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    timer.cancel();
                  },
                  child: const Text('Stop'),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
