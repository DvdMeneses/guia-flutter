import 'package:flutter/material.dart';
import 'package:guia_project/components/buttons.dart';

class GenericAppBar extends StatefulWidget implements PreferredSizeWidget {
  const GenericAppBar({Key? key}) : super(key: key);

  @override
  _GenericAppBarState createState() => _GenericAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 0); // Ajuste a altura para acomodar o dropdown
}

class _GenericAppBarState extends State<GenericAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SingleChoice(),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 222, 21, 31),
      leading: Container(
        padding: const EdgeInsets.all(2),
        child: IconButton(
          icon: const Icon(Icons.menu_open, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // Ação de pesquisa
          },
        ),
      ],
    );
  }
}
