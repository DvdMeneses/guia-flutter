import 'motel.dart';

class Response {
  final bool sucesso;
  final Data data;

  Response({required this.sucesso, required this.data});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      sucesso: json['sucesso'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final double raio;
  final double maxPaginas;
  final List<Motel> moteis;

  Data({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var moteisJson = json['moteis'] as List;
    List<Motel> moteisList =
        moteisJson.map((motelJson) => Motel.fromJson(motelJson)).toList();

    return Data(
      pagina: json['pagina'],
      qtdPorPagina: json['qtdPorPagina'],
      totalSuites: json['totalSuites'],
      totalMoteis: json['totalMoteis'],
      raio: json['raio'],
      maxPaginas: json['maxPaginas'],
      moteis: moteisList,
    );
  }
}
