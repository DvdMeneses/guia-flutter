import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_project/components/app_bar.dart';
import 'package:guia_project/components/buttons.dart';
import 'package:guia_project/components/card_image.dart';
import 'package:guia_project/components/card_motel.dart';
import 'package:guia_project/components/card_price.dart';
import 'package:guia_project/models/category_item.dart';
import 'package:guia_project/models/itens.dart';
import 'package:guia_project/models/motel.dart';
import 'package:guia_project/models/periodo.dart';
import 'package:guia_project/models/suites.dart';
import 'package:intl/intl.dart';

void main() {
  // Testes relacionados a Cards
  group("Cards Simples", () {
    testWidgets(
      "Card Price",
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [CardPrice(time: "3 horas", price: "180")],
            ),
          ),
        ));

        await tester.pumpAndSettle(); // Garante que a UI foi atualizada

        // Formata o preço da mesma forma que no componente
        final formattedPrice = NumberFormat.currency(
          locale: 'pt_BR',
          symbol: 'R\$',
          decimalDigits: 2,
        ).format(180);

        // Verificações
        expect(find.text("3 horas"), findsOneWidget);
        expect(find.text(formattedPrice), findsOneWidget);
        expect(find.byIcon(Icons.chevron_right_rounded), findsOneWidget);
      },
    );

    testWidgets(
      "Card Image Widget",
      (WidgetTester tester) async {
        // Carrega o widget
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: CardImage(
                LocalImage: 'assets/images/local_image.jpg',
                suite: Suite(
                  nome: "Suíte Marselha Sexy",
                  qtd: 1,
                  exibirQtdDisponiveis: true,
                  fotos: [
                    "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/64838168-0e40-4087-bc99-445ee4a0754b-suites.jpg"
                  ],
                  itens: [Item(nome: "frigobar")],
                  categoriaItens: [
                    CategoryItem(
                      icone:
                          "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/64838168-0e40-4087-bc99-445ee4a0754b-suites.jpg",
                      nome: "frigobar",
                    ),
                  ],
                  periodos: [
                    Periodo(
                      tempoFormatado: "3 horas",
                      tempo: "3",
                      valor: 129,
                      valorTotal: 129,
                      temCortesia: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));

        // Verificações de conteúdo
        expect(find.text("Suíte Marselha Sexy"), findsOneWidget);
        expect(find.text("só mais 1 pelo app"), findsOneWidget);

        await tester.pump();
      },
    );

    testWidgets(
      "Dropdown Button",
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: CustomDropdown(),
            ),
          ),
        ));

        // Verifica se o texto do dropdown está presente
        expect(find.text("natal e região"), findsOneWidget);
      },
    );
  });

  // Testes relacionados a Card Image
  group("Card Motel", () {});

  // Testes relacionados ao AppBar
  group("AppBar", () {
    testWidgets(
      "AppBar Widget",
      (WidgetTester tester) async {
        // Carrega o widget com a AppBar
        await tester.pumpWidget(
          MaterialApp(home: Scaffold(appBar: GenericAppBar())),
        );

        // Verifica se os textos do título estão presentes
        expect(find.text("ir agora"), findsOneWidget);
        expect(find.text("ir outro dia"), findsOneWidget);

        // Verifica o ícone do menu
        Finder menuIcon = find.byIcon(Icons.menu_open);
        expect(menuIcon, findsOneWidget);

        // Interage com o ícone de menu
        await tester.tap(menuIcon);
        await tester
            .pumpAndSettle(); // Espera que a animação do Drawer seja concluída

        // Verifica o ícone de pesquisa
        Finder searchIcon = find.byIcon(Icons.search);
        expect(searchIcon, findsOneWidget);

        // Interage com o ícone de pesquisa
        await tester.tap(searchIcon);
        await tester.pump(); // Aguarda a UI ser atualizada
      },
    );
  });
}
