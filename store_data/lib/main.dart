import 'package:flutter/material.dart';
import 'dart:convert';
import './pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

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

  @override
  void initState() {
    getPaths();
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Doc path: ' + documentsPath),
            Text('Temp path' + tempPath),
          ],
        ),
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
}
