import 'dart:async';
import 'dart:io';

import 'package:e2e/e2e_driver.dart' as e2e;

import 'package:flutter_driver/flutter_driver.dart';

Future<void> main() async => e2e.e2eDriver(testName: 'e2e_perf', traceTimeline: true);
