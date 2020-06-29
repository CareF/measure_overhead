#!/bin/bash
# require branch https://github.com/CareF/flutter/tree/widgetTester_with_time
echo E2E perf test
FLUTTER_TEST_OUTPUTS_DIR=$(pwd) flutter drive -t test_driver/e2e_perf.dart -d pixel --profile  --trace-startup
echo flutter_driver perf test
FLUTTER_TEST_OUTPUTS_DIR=$(pwd) flutter drive -t test_driver/driver_perf.dart -d pixel --profile  --trace-startup
