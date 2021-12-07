import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget get toFitted => FittedBox(child: this);
  Widget get toCenter => Center(child: this);
}
