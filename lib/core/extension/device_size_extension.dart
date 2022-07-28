import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get deviceSize => MediaQuery.of(this);
}

extension DeviceSizeExtension on BuildContext {
  double get height => deviceSize.size.height;
  double get width => deviceSize.size.width;
}
