import 'package:flutter/widgets.dart';

extension SizeExtension on double {
  SizedBox get height => SizedBox(height: this);

  SizedBox get width => SizedBox(width: this);
}
