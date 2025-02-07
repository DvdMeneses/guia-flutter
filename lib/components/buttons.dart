import 'package:flutter/material.dart';

enum Option { first, second }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Option selectedOption = Option.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 184, 0, 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: Option.values.map((option) {
          bool isSelected = selectedOption == option;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedOption = option;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    option == Option.first ? Icons.bolt : Icons.event,
                    color: isSelected
                        ? Color.fromARGB(255, 184, 0, 12)
                        : Colors.white,
                  ),
                  const SizedBox(width: 8), // Espaço entre ícone e texto
                  Text(
                    option == Option.first ? 'ir agora' : 'ir outro dia',
                    style: TextStyle(
                      fontSize: 18,
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // Valor inicial do botão
  String dropdownValue = 'natal e região';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 15),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 130, // Limita a largura do Container
        ),
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
        ),
        child: const Row(
          mainAxisSize:
              MainAxisSize.min, // Para não ocupar mais espaço do que necessário
          children: [
            // Texto adaptável com reticências se exceder o limite
            Expanded(
              // Usado para garantir que o texto se ajuste ao Container
              child: Text(
                "natal e região",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                maxLines: 1, // Limita a 1 linha
                overflow: TextOverflow.ellipsis, // Exibe reticências
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
