import 'package:flutter_test/flutter_test.dart';
import 'package:integration_project_flutter/page_objects/counter_objects.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_project_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter View test tree press is result 3.', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final button = find.byTooltip(CounterObjects.buttonTooltip);
    await tester.press(button);
    await tester.press(button);
    await tester.press(button);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text("Result: 3"), findsOneWidget);
  });

  group('Test it result textfield', () {
    testWidgets('Result is succes scenrio for 5', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      final calculeButton = find.bySemanticsLabel(CounterObjects.buttonCalculate);
      final calculateTextField = find.byKey(CounterObjects.textFieldKey);

      await tester.enterText(calculateTextField, '5');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(calculeButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text("Result: 5"), findsOneWidget);
    });
    testWidgets('Result is fail scenrio by unkown value (it have to show zero)', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final calculeButton = find.bySemanticsLabel(CounterObjects.buttonCalculate);
      final calculateTextField = find.byKey(CounterObjects.textFieldKey);

      await tester.enterText(calculateTextField, 'asdasd');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(calculeButton);
      await tester.pumpAndSettle();
      expect(find.text("Result: 5"), findsNothing);
    });
  });
}
