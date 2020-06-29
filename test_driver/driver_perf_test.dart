import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart' hide TypeMatcher, isInstanceOf;

void main() {
  group('Test flutter driver overhead', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });

    tearDownAll(() async {
      if (driver != null)
        driver.close();
    });

    test('driver_perf', () async {
      final Timeline timeline = await driver.traceAction(() async {
        await Future<void>.delayed(const Duration(seconds: 10));
      });

      final TimelineSummary summary = TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('driver_perf', pretty: true);
      summary.writeTimelineToFile('driver_perf', pretty: true);
    });
  });
}
