import 'package:flutter/material.dart';
import 'package:guia_project/components/buttons.dart';

class FilterBar extends StatefulWidget implements PreferredSizeWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();

  // Define a altura total da FilterBar (ex.: 60)
  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _FilterBarState extends State<FilterBar> {
  List<String> filterOptions = [
    'filtros',
    'com desconto',
    'disponíveis',
    'hidro',
    'piscina',
    'sauna',
    'ofurô',
    'decoração erótica',
    'decoração temática',
    'cadeira erótica',
    'pista de dança',
    'garagem',
    'frigobar',
    'internet wi-fi',
    'suíte para festas',
    'suíte com acessibilidade',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Altura definida para a barra de filtros
      child: ListView(
        shrinkWrap: true, // Usa somente o espaço necessário
        scrollDirection: Axis.horizontal,
        children: filterOptions.map((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilterButton(
              text: option,
            ),
          );
        }).toList(),
      ),
    );
  }
}
