import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/home_page.dart';
import 'package:widget_test/secound_page.dart';

void main() {
  testWidgets('Verificar se o existe texto', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // await tester.tap(find.text('Salvar'));
    // await tester.tap(find.byKey(const Key('button_duplicated')));
    // await tester.tap(find.byType(MaterialButton));
    // await tester.longPress(find.byKey(const Key('ink_long_press')));
    // await tester.tap(find.byKey(const Key('button_delete')));

    tester.printToConsole('Clicando no botão que irá para outra tela');
    await tester.tap(find.byTooltip('Button Refresh'));

    tester.printToConsole('Esperando o Flutter terminar de renderizar tudo');
    await tester.pumpAndSettle();

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    tester.printToConsole('Verificando se chegou na segunda página');
    expect(find.byType(SecoundPage), findsOneWidget);
  });
}
