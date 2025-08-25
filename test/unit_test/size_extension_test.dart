import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hsinote/extension/size_extension.dart';

void main() {
  test('SizeExtension: 8.0.height menghasilkan SizedBox dengan height 8', () {
    const value = 8.0;
    final box = value.height;

    expect(box, isA<SizedBox>());
    expect(box.height, value);
  });

  test('SizeExtension: 12.0.width menghasilkan SizedBox dengan width 12', () {
    const value = 12.0;
    final box = value.width;

    expect(box, isA<SizedBox>());
    expect(box.width, value);
  });
}
