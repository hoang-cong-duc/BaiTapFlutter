import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bai_tap/exercises/Bai10/cart_provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}
