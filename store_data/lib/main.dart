import 'package:flutter/material.dart';
import 'dart:convert';
import './pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'httphelper.dart';
import 'pizza_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  late int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  @override
  void initState() {
    // getPaths().then((_) {
    //   myFile = File('$documentsPath/pizzas.txt');
    //   writeFile();
    // });

    callPizzas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON')),
      body: Container(
        // child: FutureBuilder(
        //   future: readJsonFile(),
        //   builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
        //     return ListView.builder(
        //       itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
        //       itemBuilder: (BuildContext context, int position) {
        //         return ListTile(
        //           title: Text(pizzas.data![position].pizzaName),
        //           subtitle: Text(
        //               '${pizzas.data![position].description} - € ${pizzas.data![position].price}'),
        //         );
        //       },
        //     );
        //   },
        // ),

        // child: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Text('You have opened the app $appCounter times.'),
        //       ElevatedButton(
        //         onPressed: () {
        //           deletePreference();
        //         },
        //         child: Text('Reset counter'),
        //       )
        //     ],
        //   ),
        // ),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Text('Doc path: ' + documentsPath),
        //     Text('Temp path: ' + tempPath),
        //     ElevatedButton(
        //       child: Text('Read File'),
        //       onPressed: () => readFile(),
        //     ),
        //     Text(fileText),
        //   ],
        // ),

        child: FutureBuilder(
          future: callPizzas(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
            // return ListView.builder(
            // itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
            // itemBuilder: (BuildContext context, int position) {
            //   return ListTile(
            return ListView.builder(
              itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
              itemBuilder: (BuildContext context, int position) {
                return Dismissible(
                  onDismissed: (item) {
                    HttpHelper helper = HttpHelper();
                    pizzas.data!.removeWhere(
                        (element) => element.id == pizzas.data![position].id);
                    helper.deletePizza(pizzas.data![position].id);
                  },
                  key: Key(position.toString()),
                  child: ListTile(
                    title: Text(pizzas.data![position].pizzaName),
                    subtitle: Text(
                        '${pizzas.data![position].description} - € ${pizzas.data![position].price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PizzaDetail(pizzas.data![position], false),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetail(Pizza(), false),
            ),
          );
        },
      ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');

    List myMap = jsonDecode(myString);
    List<Pizza> myPizzas = [];

    // myMap.forEach((dynamic pizza) {
    //   Pizza myPizza = Pizza.fromJson(pizza);
    //   myPizzas.add(myPizza);
    // });

    // String json = convertToJSON(myPizzas);
    // print(json);

    myMap.forEach((dynamic pizza) {
      Pizza? myPizza = Pizza.fromJsonOrNull(pizza);
      if (myPizza != null) myPizzas.add(myPizza);
    });

    return myPizzas;
  }

  String convertToJSON(List<Pizza> pizzas) {
    String json = '[';
    pizzas.forEach((pizza) {
      json += jsonEncode(pizza);
    });
    json += ']';
    return json;
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appCounter = (prefs.getInt('appCounter') == null)
        ? 1
        : prefs.getInt('appCounter')! + 1;
    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      // Read the file.
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      // On error, return false.
      return false;
    }
  }

  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza>? pizzas = await helper.getPizzaList();
    return pizzas!;
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final pwdController = TextEditingController();
//   String myPass = '';
//   final storage = FlutterSecureStorage();
//   final myKey = 'myPass';

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Path Provider')),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: pwdController,
//                 ),
//                 ElevatedButton(
//                     child: Text('Save Value'),
//                     onPressed: () {
//                       writeToSecureStorage();
//                     }),
//                 ElevatedButton(
//                     child: Text('Read Value'),
//                     onPressed: () {
//                       readFromSecureStorage().then((value) {
//                         setState(() {
//                           myPass = value;
//                         });
//                       });
//                     }),
//                 Text(myPass),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future writeToSecureStorage() async {
//     await storage.write(key: myKey, value: pwdController.text);
//   }

//   Future<String> readFromSecureStorage() async {
//     String? secret = await storage.read(key: myKey);
//     return secret!;
//   }
// }
