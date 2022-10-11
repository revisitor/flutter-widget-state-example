import 'package:flutter/material.dart';
import 'package:snackbar/strings.dart';

class SnackBarView extends StatelessWidget {
  const SnackBarView({super.key});

  static const _title = Strings.title;
  static const _buttonText = 'OK';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: () {}, child: const Text(_buttonText)),
      ),
    );
  }
}
