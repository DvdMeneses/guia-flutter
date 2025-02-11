import 'suites.dart';

class Motel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final int qtdAvaliacoes;
  final double media;
  final List<Suite> suites;

  Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.qtdAvaliacoes,
    required this.media,
    required this.suites,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    var suitesJson = json['suites'] as List;
    List<Suite> suitesList =
        suitesJson.map((suiteJson) => Suite.fromJson(suiteJson)).toList();
    return Motel(
      fantasia: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: json['distancia'],
      qtdFavoritos: json['qtdFavoritos'],
      qtdAvaliacoes: json['qtdAvaliacoes'] ?? 0,
      media: json['media'] ?? 0,
      suites: suitesList,
    );
  }
}
