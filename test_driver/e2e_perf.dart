import 'package:e2e/e2e.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:measure_overhead/main.dart' as app;

void main() {
  E2EWidgetsFlutterBinding.ensureInitialized();
  testWidgets('test e2e overhead', (WidgetTester tester) async {
    app.main();
    await tester.pump();  // Wait for the first frame.
    await tester.pumpContinuous(const Duration(seconds: 10));
  });
}
