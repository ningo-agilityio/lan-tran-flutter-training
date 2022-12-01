import 'package:flutter/material.dart';
import 'countdown_bloc.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

// class _StreamHomePageState extends State<StreamHomePage> {
//   late Color bgColor = Colors.white;
//   late ColorStream colorStream;

//   int lastNumber = 0;
//   late StreamController numberStreamController;
//   late NumberStream numberStream;

//   late StreamTransformer transformer =
//       StreamTransformer<int, dynamic>.fromHandlers();

//   late StreamSubscription subscription;
//   late StreamSubscription subscription2;
//   String values = '';

//   @override
//   void initState() {
//     // colorStream = ColorStream();
//     // numberStream = NumberStream();
//     // numberStreamController = numberStream.controller;
//     // Stream stream = numberStreamController.stream;

//     // transformer = StreamTransformer<int, dynamic>.fromHandlers(
//     //     handleData: (value, sink) {
//     //       sink.add(value * 10);
//     //     },
//     //     handleError: (error, trace, sink) {
//     //       sink.add(-1);
//     //     },
//     //     handleDone: (sink) => sink.close());

//     // stream.transform(transformer).listen((event) {
//     //   setState(() {
//     //     lastNumber = event;
//     //   });
//     // }).onError((error) {
//     //   setState(() {
//     //     lastNumber = -1;
//     //   });
//     // });

//     numberStream = NumberStream();
//     numberStreamController = numberStream.controller;
//     Stream stream = numberStreamController.stream.asBroadcastStream();

//     subscription = stream.listen((event) {
//       setState(() {
//         values += event.toString() + ' - ';
//       });
//     });
//     subscription2 = stream.listen((event) {
//       setState(() {
//         values += event.toString() + ' - ';
//       });
//     });

//     subscription.onError((error) {
//       setState(() {
//         lastNumber = -1;
//       });
//     });

//     subscription.onDone(() {
//       print('OnDone was called');
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stream'),
//       ),
//       body: Container(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(values),
//             ElevatedButton(
//               onPressed: () => addRandomNumber(),
//               child: Text('New Random Number'),
//             ),
//             ElevatedButton(
//               onPressed: () => stopStream(),
//               child: Text('Stop Stream'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   changeColor() async {
//     await for (var eventColor in colorStream.getColors()) {
//       setState(() {
//         bgColor = eventColor;
//       });
//     }
//   }

//   void addRandomNumber() {
//     // Random random = Random();
//     // int myNum = random.nextInt(10);
//     // numberStream.addNumberToSink(myNum);

//     Random random = Random();
//     int myNum = random.nextInt(10);
//     if (!numberStreamController.isClosed) {
//       numberStream.addNumberToSink(myNum);
//     } else {
//       setState(() {
//         lastNumber = -1;
//       });
//     }
//   }

//   void stopStream() {
//     numberStreamController.close();
//   }
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   late Stream<int> numberStream;

//   @override
//   void initState() {
//     numberStream = NumberStream().getNumbers();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stream'),
//       ),
//       body: Container(
//         child: StreamBuilder(
//           stream: numberStream,
//           initialData: 0,
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               print('Error!');
//             }
//             if (snapshot.hasData) {
//               return Center(
//                 child: Text(
//                   snapshot.data.toString(),
//                   style: TextStyle(fontSize: 96),
//                 ),
//               );
//             } else {
//               return Center();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

class _StreamHomePageState extends State<StreamHomePage> {
  late TimerBLoC timerBloc;
  late int seconds;

  @override
  void initState() {
    timerBloc = TimerBLoC();
    seconds = timerBloc.seconds;
    timerBloc.countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: timerBloc.secondsStream,
          initialData: seconds,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error!');
            }
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 96),
                ),
              );
            } else {
              return Center();
            }
          },
        ),
      ),
    );
  }
}
