import 'package:flutter/material.dart';
import 'package:guia_project/components/card_icons.dart';
import 'package:guia_project/components/card_image.dart';
import 'package:guia_project/components/card_price.dart';
import 'package:guia_project/models/motel.dart';

class CardMotel extends StatefulWidget {
  final Motel motel;

  const CardMotel({
    Key? key,
    required this.motel,
  }) : super(key: key);

  @override
  _CardMotelState createState() => _CardMotelState();
}

class _CardMotelState extends State<CardMotel> {
  bool _isFavorited = false; // Estado para controlar o ícone
  PageController _pageController =
      PageController(); // PageController for PageView

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Fixed section (Image, Name, Location, Icon)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.network(
                    widget.motel.logo,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.motel.fantasia.toLowerCase(),
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        widget.motel.bairro.toLowerCase(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber, width: 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${widget.motel.media}",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${widget.motel.qtdAvaliacoes}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavorited = !_isFavorited;
                      });
                    },
                    icon: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite,
                      color: _isFavorited
                          ? Colors.red
                          : const Color.fromARGB(255, 194, 194, 194),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Scrollable section (rooms with different price options)
          Container(
            height: 780,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.motel.suites.length,
              itemBuilder: (context, index) {
                var suite = widget.motel.suites[index];
                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      CardImage(
                        suite: widget.motel.suites[index],
                        LocalImage: '',
                      ),
                      CardIcons(
                        itens: widget.motel.suites[index].categoriaItens,
                      ),
                      Column(
                        children: suite.periodos.map<Widget>((opcao) {
                          return CardPrice(
                            time: opcao.tempoFormatado,
                            price: '${opcao.valor}',
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
