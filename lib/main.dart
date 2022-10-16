import 'package:flutter/material.dart';
import 'package:snackbar/snackbar_view.dart';
import 'package:snackbar/strings.dart';

void main() => runApp(const MainView());

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: Strings.title, home: SnackbarView());
  }
}
