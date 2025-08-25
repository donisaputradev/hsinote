import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hsinote/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App launch dan render halaman awal', (
    WidgetTester tester,
  ) async {
    // Jalankan aplikasi penuh
    app.main();
    await tester.pumpAndSettle();

    // Pastikan teks tertentu muncul (misalnya judul / label input login)
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
