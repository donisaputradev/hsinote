import 'package:flutter_test/flutter_test.dart';
import 'package:hsinote/model/user_model.dart';

void main() {
  group('UserModel', () {
    test('fromJson & toJson harus saling konsisten', () {
      final json = {
        'id': 'u_1',
        'name': 'Doni',
        'email': 'doni@example.com',
        'password': 'secret',
      };

      final user = UserModel.fromJson(json);
      expect(user.id, 'u_1');
      expect(user.name, 'Doni');
      expect(user.email, 'doni@example.com');
      expect(user.password, 'secret');

      final back = user.toJson();
      expect(back, json);
    });
  });
}
