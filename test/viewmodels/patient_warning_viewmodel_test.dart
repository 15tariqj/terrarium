import 'package:flutter_test/flutter_test.dart';
import 'package:terrarium/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PatientWarningViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
