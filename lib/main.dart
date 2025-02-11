import 'package:flutter/material.dart';
import 'package:guia_project/components/app_bar.dart';
import 'package:guia_project/components/buttons.dart';
import 'package:guia_project/components/card_motel.dart';
import 'package:guia_project/components/card_promo.dart';
import 'package:guia_project/components/filter_bar.dart';
import 'package:guia_project/providers/motel_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Moteis(), // Provider for the motel data
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple), // Setting the theme color
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
  bool _isLoading =
      true; // A flag to indicate whether the data is still loading

  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data when the page initializes
  }

  // Function to fetch motel data asynchronously
  Future<void> _fetchData() async {
    final motelProvider = Provider.of<Moteis>(context, listen: false);
    await motelProvider.fetchMotelData(); // Fetch motel data from the provider
    setState(() {
      _isLoading = false; // Update the loading state once the data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    final motelProvider = Provider.of<Moteis>(
        context); // Accessing the motel data from the provider

    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 222, 21, 31), // Setting the background color
      appBar: GenericAppBar(), // Custom app bar
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: CustomDropdown(), // Custom dropdown widget
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              child: Container(
                color: const Color.fromARGB(
                    255, 240, 240, 240), // Background color for the body
                child: _isLoading
                    ? Center(
                        child:
                            CircularProgressIndicator(), // Show loading spinner while data is loading
                      )
                    : CustomScrollView(
                        // Once data is loaded, display scrollable content
                        slivers: [
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: CardPromo(
                                // Display a promotional card
                                imageUrl:
                                    'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9828_2.jpg',
                                name: 'Alí Motel',
                                location: 'Emaús - Parnamirim',
                                price: 57.98,
                              ),
                            ),
                          ),

                          // Persistent header that stays at the top while scrolling
                          SliverPersistentHeader(
                            pinned: true,
                            floating: true,
                            delegate: _SliverAppBarDelegate(
                              minHeight: 60.0,
                              maxHeight: 60.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 248, 249, 251),
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Color.fromARGB(
                                              255, 201, 201, 201),
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
                                        child: FilterBar(), // Filter bar widget
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // List of motel cards, using SliverList for dynamic content
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: CardMotel(
                                      // Display individual motel card
                                      motel: motelProvider.moteis[index],
                                    ));
                              },
                              childCount: motelProvider
                                  .moteis.length, // Number of motels to display
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

// Delegate for the SliverPersistentHeader, handling the app bar behavior
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
  double get minExtent => minHeight; // Minimum height for the header

  @override
  double get maxExtent => maxHeight; // Maximum height for the header

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
        child: child); // Expands the header to fill available space
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child !=
            oldDelegate.child; // Determines if the header should be rebuilt
  }
}
