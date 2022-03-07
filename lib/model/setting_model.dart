import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorSetProvider = Provider(
      (ref) {
        return Color.fromRGBO(150, 186, 255, 100); }
);