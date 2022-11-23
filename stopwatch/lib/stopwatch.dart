import 'dart:async';
import 'package:flutter/material.dart';

import 'platform_alert.dart';

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
  late Timer timer;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();
  bool isTicking = false;

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
            // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
        Builder(
          builder: (context) {
            return TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text('Stop'),
              onPressed: isTicking ? () => _stopTimer(context) : null,
            );
          },
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

  void _stopTimer(BuildContext context) {
    timer.cancel();
    setState(() {
      isTicking = false;
    });

    // final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    // final alert = PlatformAlert(
    //   title: 'Run Completed!',
    //   message: 'Total Run Time is ${_secondsText(totalRuntime)}.',
    // );
    // alert.show(context);

    // showBottomSheet(context: context, builder: _buildRunCompleteSheet);

    final controller =
        showBottomSheet(context: context, builder: _buildRunCompleteSheet);
    Future.delayed(Duration(seconds: 5)).then((_) {
      controller.close();
    });
  }

  Widget _buildRunCompleteSheet(BuildContext context) {
    final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        color: Theme.of(context).cardColor,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Run Finished!', style: textTheme.headline6),
              Text('Total Run Time is ${_secondsText(totalRuntime)}.')
            ],
          ),
        ),
      ),
    );
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  // Widget _buildLapDisplay() {
  //   return ListView(
  //     physics: BouncingScrollPhysics(),
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
