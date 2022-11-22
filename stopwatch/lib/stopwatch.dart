import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  static const route = '/stopwatch';
  final String name;
  final String email;
  const StopWatch({Key? key, this.name = '', this.email = ''})
      : super(key: key);

  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  late Timer timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();
  bool isTicking = true;

  // @override
  // void initState() {
  //   super.initState();
  //   seconds = 0;
  //   timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  // }

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    Object name = ModalRoute.of(context)!.settings.arguments ?? '';

    return Scaffold(
      appBar: AppBar(
        // title: Text('Stopwatch'),
        title: Text('$name'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 20),
          _buildControls(context)
        ],
      ),
    );
  }

  Widget _buildControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Lap ${laps.length + 1}',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
        Text(
          _secondsText(milliseconds),
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text('Start'),
          onPressed: isTicking ? null : _startTimer,
        ),
        SizedBox(width: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
          ),
          child: Text('Lap'),
          onPressed: isTicking ? _lap : null,
        ),
        SizedBox(width: 20),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text('Stop'),
          onPressed: isTicking ? _stopTimer : null,
        ),
      ],
    );
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
    scrollController.animateTo(
      itemHeight * laps.length,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  // Widget _buildLapDisplay() {
  //   return ListView(
  //     // physics: BouncingScrollPhysics(),
  //     children: [
  //       for (int milliseconds in laps)
  //         ListTile(
  //           title: Text(_secondsText(milliseconds)),
  //         )
  //     ],
  //   );
  // }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeight,
        itemCount: laps.length,
        itemBuilder: (context, index) {
          final milliseconds = laps[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            title: Text('Lap ${index + 1}'),
            trailing: Text(_secondsText(milliseconds)),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
