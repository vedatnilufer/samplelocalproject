import 'package:flutter/widgets.dart';

NetworkImage randomImage(int id) => NetworkImage('https://picsum.photos/${id % 10 > 0 ? (id % 10) + 1 : 3}00/500');
