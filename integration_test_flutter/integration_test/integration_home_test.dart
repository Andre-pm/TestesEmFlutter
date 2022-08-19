import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_flutter/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  sleepSec(int sec) => sleep(Duration(seconds: sec));

  testWidgets('Testando a home page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byTooltip('Increment'));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    sleepSec(2);

    await tester.enterText(
      find.byKey(const Key('text_field_login')),
      'Andre_pm',
    );
    await tester.pumpAndSettle();

    sleepSec(2);

    await tester.enterText(
      find.byKey(const Key('text_field_senha')),
      'Password123@*!',
    );
    await tester.pumpAndSettle();
    sleepSec(5);
  });
}
