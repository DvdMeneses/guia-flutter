import 'itens.dart';
import 'category_item.dart';
import 'periodo.dart';

class Suite {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<Item> itens;
  final List<CategoryItem> categoriaItens;
  final List<Periodo> periodos;

  Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    var itensJson = json['itens'] as List;
    List<Item> itensList =
        itensJson.map((itemJson) => Item.fromJson(itemJson)).toList();

    var categoriaItensJson = json['categoriaItens'] as List;
    List<CategoryItem> categoriaItensList = categoriaItensJson
        .map((catItemJson) => CategoryItem.fromJson(catItemJson))
        .toList();

    var periodosJson = json['periodos'] as List;
    List<Periodo> periodosList = periodosJson
        .map((periodoJson) => Periodo.fromJson(periodoJson))
        .toList();

    return Suite(
      nome: json['nome'],
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      fotos: List<String>.from(json['fotos']),
      itens: itensList,
      categoriaItens: categoriaItensList,
      periodos: periodosList,
    );
  }
}
