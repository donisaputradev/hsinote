import 'package:flutter_test/flutter_test.dart';
import 'package:hsinote/enum/status_enum.dart';

void main() {
  test('StatusEnum memiliki 4 nilai sesuai urutan', () {
    expect(StatusEnum.values.length, 4);
    expect(StatusEnum.values, [
      StatusEnum.initial,
      StatusEnum.loading,
      StatusEnum.failure,
      StatusEnum.success,
    ]);
  });
}
