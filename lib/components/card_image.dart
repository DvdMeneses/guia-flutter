import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:guia_project/models/suites.dart';

class CardImage extends StatelessWidget {
  final Suite suite;

  const CardImage({
    Key? key,
    required this.suite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Checks if the suite name contains "s/ garagem privativa" and splits it if necessary
    String nomeSuite = suite.nome.contains("s/ garagem privativa")
        ? suite.nome.split(" s/ garagem privativa")[
            0] // Takes the part before "s/ garagem privativa"
        : suite.nome; // If not found, show the full name

    return Card(
      color: Colors.white,
      child: Container(
        width: 350,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "${suite.fotos[0]}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 8),
                child: Text(
                  nomeSuite,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              suite.exibirQtdDisponiveis
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wb_twilight_outlined,
                          size: 16,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "só mais ${suite.qtd} pelo app",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
