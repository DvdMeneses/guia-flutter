import 'package:flutter/material.dart';

class CardIcons extends StatelessWidget {
  const CardIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Usando Flexible para os ícones
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 248, 249, 251),
                  ),
                  height: 50,
                  child: Image.network(
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png",
                    fit: BoxFit.contain, // Ajusta a imagem ao contêiner
                  ),
                ),
              ),
              SizedBox(width: 10), // Espaçamento entre os ícones
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 248, 249, 251),
                  ),
                  height: 50,
                  child: Image.network(
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 248, 249, 251),
                  ),
                  height: 50,
                  child: Image.network(
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 248, 249, 251),
                  ),
                  height: 50,
                  child: Image.network(
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Container do "ver todos" com Flexible
              Flexible(
                child: Container(
                  height: 50,
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ver',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Text(
                            'todos',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
