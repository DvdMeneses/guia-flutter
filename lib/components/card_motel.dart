import 'package:flutter/material.dart';
import 'package:guia_project/components/card_icons.dart';
import 'package:guia_project/components/card_price.dart';

class CardMotel extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final double price;

  const CardMotel({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.network(
                  'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif'),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18), // Ajuste fino de posição
                  child: Text(
                    location.toLowerCase(),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ),
                Text(
                  name.toLowerCase(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        CardIcons(),
        CardPrice(time: "3 horas", price: "57,98")
      ],
    );
  }
}
