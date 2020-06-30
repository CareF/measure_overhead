import 'package:e2e/e2e.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:measure_overhead/main.dart' as app;

Future<void> main() async {
  final E2EWidgetsFlutterBinding binding =
  E2EWidgetsFlutterBinding.ensureInitialized() as E2EWidgetsFlutterBinding;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  testWidgets('E2E perf test', (WidgetTester tester) async {
    //await benchmarkWidgets((WidgetTester tester) async {
    app.main();
    await Future<void>.delayed(const Duration(seconds: 10));
    // await tester.pump();  // Wait for the first frame.
    // await tester.pumpContinuous(const Duration(seconds: 10), frequency: 90.0);
  }, semanticsEnabled: false);
}