import 'dart:async';
import 'dart:io';

import 'package:e2e/common.dart' as e2e;

import 'package:flutter_driver/flutter_driver.dart';

Future<void> main() async {
  const String testName = 'e2e_perf';
  final FlutterDriver driver = await FlutterDriver.connect();
  String jsonResult;
  final Timeline timeline = await driver.traceAction(() async {
    jsonResult = await driver.requestData(
        null, timeout: const Duration(minutes: 1));
  });

  final e2e.Response response = e2e.Response.fromJson(jsonResult);
  await driver.close();

  if (response.allTestsPassed) {
    print('All tests passed.');
    final TimelineSummary summary = TimelineSummary.summarize(timeline);
    await summary.writeTimelineToFile(testName, pretty: true);
    await summary.writeSummaryToFile(testName, pretty: true);
    exit(0);
  } else {
    print('Failure Details:\n${response.formattedFailureDetails}');
    exit(1);
  }
}