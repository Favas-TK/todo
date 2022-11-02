import 'package:flutter_test/flutter_test.dart';

import 'package:todo/login/login.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const Login());
      expect(find.byType(Login), findsOneWidget);
    });
  });
}
