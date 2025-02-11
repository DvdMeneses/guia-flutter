import 'package:flutter/material.dart';
import 'package:guia_project/models/category_item.dart';

class CardIcons extends StatelessWidget {
  final List<CategoryItem> itens;

  const CardIcons({
    Key? key,
    required this.itens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        width: 350,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...itens.take(4).map((item) => Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 248, 249, 251),
                      ),
                      height: 50,
                      child: Image.network(
                        item.icone, // get icon url
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
              const SizedBox(width: 10),
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
                      SizedBox(width: 5),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
