import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ideast/main.dart';
import 'package:ideast/screens/auth_screens/signup_screen.dart';
import 'package:ideast/screens/home_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void sleepSec(int secounds) => sleep(Duration(seconds: secounds));

  group(
    'Testando as nossas páginas com integration test',
    () {
      testWidgets(
        'Criando uma conta',
        (WidgetTester tester) async {
          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();

          await tester.tap(find.byKey(const Key('button_singup')));
          await tester.pumpAndSettle();

          sleepSec(2);

          expect(find.byType(SignUpScreen), findsOneWidget);

          final timeMilli = DateTime.now().microsecond;

          await tester.enterText(
            find.byKey(const Key('textfield_email')),
            'e-mail$timeMilli@gmail.com',
          );
          await tester.pumpAndSettle();

          await tester.enterText(
            find.byKey(const Key('textfield_password')),
            'Password@123',
          );
          await tester.pumpAndSettle();

          await tester.enterText(
            find.byKey(const Key('textfield_confirm_password')),
            'Password@123',
          );
          await tester.pumpAndSettle();

          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pumpAndSettle();

          sleepSec(2);
          await tester.tap(find.byKey(const Key('button_enter')));
          await tester.pumpAndSettle();
          sleepSec(1);

          expect(find.byType(HomeScreen), findsOneWidget);
        },
      );
    },
  );

  testWidgets('Fazer login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const ValueKey('emailLoginField')),
      'andre@gmail.com',
    );

    await tester.pump();
    sleepSec(2);

    await tester.enterText(
      find.byKey(const ValueKey('passwordLoginField')),
      'Teste@123',
    );
    await tester.pump();

    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();
    sleepSec(10);
  });
}
