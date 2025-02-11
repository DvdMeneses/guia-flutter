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
  String dropdownValue = 'natal e região';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 15),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 130,
        ),
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                "natal e região",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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

class FilterButton extends StatefulWidget {
  final String text;

  FilterButton({required this.text});

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  late Color _buttonColor;

  static const Color _initialColor = Colors.white;
  static const Color _selectedColor = Color.fromARGB(255, 222, 21, 31);

  @override
  void initState() {
    super.initState();
    _buttonColor = _initialColor;
  }

  void _onPressed() {
    if (widget.text.toLowerCase() != 'filtros') {
      setState(() {
        _buttonColor =
            _buttonColor == _initialColor ? _selectedColor : _initialColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: widget.text.toLowerCase() == 'filtros'
            ? _initialColor
            : _buttonColor,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        minimumSize: Size(0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            width: 0.5,
            color: Color.fromARGB(255, 201, 201, 201),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.text.toLowerCase() == 'filtros')
            Icon(Icons.tune, size: 16, color: Colors.black),
          if (widget.text.toLowerCase() == 'filtros') SizedBox(width: 5),
          Text(
            widget.text,
            style: TextStyle(
              color: _buttonColor == _selectedColor
                  ? Colors.white
                  : const Color.fromARGB(255, 52, 52, 52),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
