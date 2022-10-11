import 'package:flutter/material.dart';
import 'package:snackbar/show_snackbar_view.dart';
import 'package:snackbar/strings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const _title = Strings.title;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: _title, home: SnackBarView());
  }
}
