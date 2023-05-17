import 'package:flutter/material.dart';
import 'package:shopping/app.dart';

import 'data/service/injection/injection_mpi.dart';

void main() {
  configureInjection();

  runApp(const ShoppingApp());
}
