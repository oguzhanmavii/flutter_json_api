import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:json_api/model/load_api_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String
      title; // homepage içinde title String i çağırılıcak o yüzden yukarıda key in yanına tanımladık

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON API"),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<loadApiData>(
        future: apiCall(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                color: Colors.grey,
                child: Center(
                    child: Text(
                  "Kullanıcı Adı : ${snapshot.data!.username}\n"
                  "Email : ${snapshot.data!.email}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                )));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<loadApiData> apiCall() async {
  final response = await http.get(Uri.parse(
      "https://raw.githubusercontent.com/oguzhanmavii/api_json/master/api.json"));
  if (response.statusCode == 200) {
    return loadApiData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}
