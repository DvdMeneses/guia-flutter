import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guia_project/models/motel.dart';
import 'package:http/http.dart' as http;

class Moteis with ChangeNotifier {
  List<Motel> _moteis = [];

  List<Motel> get moteis => _moteis;

  Future<void> fetchMotelData() async {
    final response =
        await http.get(Uri.parse('https://www.jsonkeeper.com/b/1IXK'));

    print("Response Status: ${response.statusCode}");

    // Check if the response is successful (status code 200)
    if (response.statusCode == 200) {
      var decodedResponse = utf8.decode(response.bodyBytes);
      // Decode the JSON data from the response
      var data = jsonDecode(decodedResponse);
      // Check if the response contains 'data' and 'moteis'
      if (data != null &&
          data['data'] != null &&
          data['data']['moteis'] != null) {
        List<Motel> fetchedMoteis = (data['data']['moteis'] as List)
            .map((motelJson) => Motel.fromJson(motelJson))
            .toList();

        _moteis = fetchedMoteis;
        notifyListeners();
        print("Moteis Fetched: $_moteis");
      } else {
        _moteis = [];
        notifyListeners();
        print("No motels data found.");
      }
    } else {
      _moteis = [];
      notifyListeners();
      print("Failed to load data: ${response.statusCode}");
    }
  }
}

// Class to represent the API response structure
class Response {
  final List<Motel> moteis;

  Response({required this.moteis});

  factory Response.fromJson(Map<String, dynamic> json) {
    var moteisJson = json['data']['moteis'] as List;
    List<Motel> moteisList =
        moteisJson.map((motelJson) => Motel.fromJson(motelJson)).toList();

    return Response(moteis: moteisList);
  }
}
