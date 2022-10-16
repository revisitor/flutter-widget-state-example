import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:snackbar/strings.dart';

class SnackbarView extends StatelessWidget {
  const SnackbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.title)),
      body: Column(
        children: const [
          SnackbarWidget(),
          LoggingWidget(),
          ExpandingTextWidget(),
        ],
      ),
    );
  }
}

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({super.key});

  final _snackbar = const SnackBar(
    content: Text('Кнопка OK нажата'),
    duration: Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _showSnackbar(context),
        child: const Text('OK'),
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(_snackbar);
  }
}

class LoggingWidget extends StatefulWidget {
  const LoggingWidget({super.key});

  @override
  State<StatefulWidget> createState() => _LoggingWidgetState();
}

class _LoggingWidgetState extends State<LoggingWidget> {
  final _logger = Logger();

  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const defaultLogButtonText = Text('Обычное логирование');
    const loggerButtonText = Text('Логирование Logger');
    return Column(children: [
      TextField(controller: _textController),
      ElevatedButton(onPressed: _printDefaultLog, child: defaultLogButtonText),
      ElevatedButton(onPressed: _printLoggerLog, child: loggerButtonText),
    ]);
  }

  void _printDefaultLog() => debugPrint(_textController.text);

  void _printLoggerLog() => _logger.v(_textController.text);
}

class ExpandingTextWidget extends StatefulWidget {
  const ExpandingTextWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ExpandingTextWidgetState();
}

class _ExpandingTextWidgetState extends State<ExpandingTextWidget> {
  var _isExpanded = false;

  final _expandedTextStyle = const TextStyle(fontSize: 25, color: Colors.green);
  final _defaultTextStyle = const TextStyle(fontSize: 14, color: Colors.red);

  final _expandedButtonText = const Text('Уменьшить');
  final _defaultButtonText = const Text('Увеличить');

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Трефелов Михаил Андреевич', style: _getTextStyle()),
      ElevatedButton(onPressed: _changeExpandedState, child: _getButtonText()),
    ]);
  }

  TextStyle _getTextStyle() {
    return _isExpanded ? _expandedTextStyle : _defaultTextStyle;
  }

  void _changeExpandedState() => setState(() => _isExpanded = !_isExpanded);

  Text _getButtonText() {
    return _isExpanded ? _expandedButtonText : _defaultButtonText;
  }
}
