import 'package:flutter/material.dart';
import 'package:guia_project/components/app_bar.dart';
import 'package:guia_project/components/buttons.dart';
import 'package:guia_project/components/card_motel.dart';
import 'package:guia_project/components/card_promo.dart';
import 'package:guia_project/components/filter_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 21, 31),
      appBar: GenericAppBar(),
      body: Column(
        children: [
          // CustomDropdown (mantido no topo)
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: CustomDropdown(),
          ),

          // Parte rolável com bordas arredondadas
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              child: Container(
                color: const Color.fromARGB(255, 240, 240, 240),
                child: CustomScrollView(
                  slivers: [
                    // Primeiro Card (acima da FilterBar)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CardPromo(
                          imageUrl:
                              'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9828_2.jpg',
                          name: 'Alí Motel',
                          location: 'Emaús - Parnamirim',
                          price: 57.98,
                        ),
                      ),
                    ),

                    // FilterBar (gruda no topo quando está prestes a sair da tela)
                    SliverPersistentHeader(
                      pinned: true, // Faz a barra "grudar" no topo
                      floating:
                          true, // Permite que a barra apareça rapidamente ao rolar para cima
                      delegate: _SliverAppBarDelegate(
                        minHeight: 60.0,
                        maxHeight: 60.0,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 248, 249, 251),
                              border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 201, 201, 201),
                                    width: 1,
                                    style: BorderStyle.solid),
                              )),
                          width: double.infinity,
                          height: 60,
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: 35,
                                  child: FilterBar(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Lista de Cards
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CardMotel(
                            imageUrl:
                                'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9828_2.jpg',
                            name: 'Alí Motel',
                            location: 'Emaús - Parnamirim',
                            price: 57.98,
                          );
                        },
                        childCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Delegate para o SliverPersistentHeader
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
