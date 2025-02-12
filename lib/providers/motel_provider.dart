import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guia_project/models/motel.dart';
import 'package:http/http.dart' as http;

class Moteis with ChangeNotifier {
  List<Motel> _moteis = [];
  late final http.Client client;

  Moteis({http.Client? client}) {
    this.client = client ?? http.Client();
  }

  List<Motel> get moteis => _moteis;

  Future<void> fetchMotelData() async {
    _moteis = [];
    notifyListeners();

    try {
      final response =
          await client.get(Uri.parse('https://www.jsonkeeper.com/b/1IXK'));

      print("Response Status: ${response.statusCode}");

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        var decodedResponse = utf8.decode(response.bodyBytes);
        dynamic data;
        try {
          data = jsonDecode(decodedResponse);
        } catch (e) {
          print("Erro ao decodificar JSON: $e");
          return;
        }

        if (data is Map &&
            data.containsKey('data') &&
            data['data'] is Map &&
            data['data'].containsKey('moteis') &&
            data['data']['moteis'] is List) {
          _moteis = (data['data']['moteis'] as List)
              .map((motelJson) => Motel.fromJson(motelJson))
              .toList();
        } else {
          print("Estrutura de JSON inválida.");
        }
      } else {
        print("Resposta vazia ou código de status inválido.");
      }
    } catch (e) {
      print("Erro ao buscar motéis: $e");
    }
    notifyListeners();
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
