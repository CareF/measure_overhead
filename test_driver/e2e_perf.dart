import 'package:e2e/e2e.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:measure_overhead/main.dart' as app;

void main() {
  final E2EWidgetsFlutterBinding binding =
      E2EWidgetsFlutterBinding.ensureInitialized() as E2EWidgetsFlutterBinding;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  testWidgets('test e2e overhead', (WidgetTester tester) async {
    app.main();
    await tester.pump();  // Wait for the first frame.
    await tester.pumpContinuous(const Duration(seconds: 10), frequency: 90.0);
  }, semanticsEnabled: false);
}
