// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // É tipo o runApp que fica dentro da lib.
    await tester.pumpWidget(const MyApp());

    // expect - Testa se o valor está vindo certo.
    // find - do tipo Finder, usado para encontrar Widgets através de propriedades.
    // findsonewidget - É um Matcher, ele é usado para testar se foi encontrado somente 1 widget.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // tester - Usado para clicar em botões, inserir textos, usar o pumpWidget e etc.
    await tester.tap(find.byIcon(Icons.add));
    // o .pump é usado para ativar um frame depois de determinada duração, normalmente usado depois que fazemos
    //uma ação que necessita esperar um pouquinho para o Flutter "mudar" o estado do Widget.
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
