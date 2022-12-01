import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMap(),
    );
  }
}

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late LatLng userPosition = const LatLng(51.5285582, -0.24167);
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () => findPlaces(),
          )
        ],
      ),
      body: FutureBuilder(
        future: findUserLocation(),
        builder: (BuildContext context, AsyncSnapshot<LatLng> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Something terrible happened!');
            }
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: snapshot.requireData,
                zoom: 13,
              ),
              markers: Set<Marker>.of(markers),
            );
          } else {
            return Text('');
          }
        },
      ),
    );
  }

  Future<LatLng> findUserLocation() async {
    Location location = Location();
    LocationData userLocation;
    PermissionStatus hasPermission = await location.hasPermission();
    bool active = await location.serviceEnabled();

    if (hasPermission == PermissionStatus.granted && active) {
      userLocation = await location.getLocation();
      userPosition = LatLng(userLocation.latitude!, userLocation.longitude!);
    } else {
      userPosition = const LatLng(51.5285582, -0.24167);
    }
    return userPosition;
  }

  Future findPlaces() async {
    final String key = "AIzaSyDNI_ZWPqvdS6r6gPVO50I4TlYkfkZdXh8";
    final String placesUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?';

    String url = placesUrl +
        'key=$key&type=restaurant&location=${userPosition.latitude},${userPosition.longitude}' +
        '&radius=1000';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      showMarkers(data);
    } else {
      throw Exception('Unable to retrieve places');
    }
  }

  showMarkers(data) {
    List places = data['results'];
    markers.clear();

    places.forEach((place) {
      markers.add(
        Marker(
          markerId: MarkerId(place['reference']),
          position: LatLng(
            place['geometry']['location']['lat'],
            place['geometry']['location']['lng'],
          ),
          infoWindow: InfoWindow(
            title: place['name'],
            snippet: place['vicinity'],
          ),
        ),
      );
    });

    setState(() {
      markers = markers;
    });
  }
}
