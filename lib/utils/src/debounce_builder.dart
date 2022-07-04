import 'package:flutter/widgets.dart';

import 'debounce_timer.dart';

/// Callback call after delay
typedef DebounceCallback = void Function(VoidCallback callback);

/// Debounce builder, provide debounce function
typedef DebounceTimerBuilder = Widget Function(
  BuildContext context,
  DebounceCallback debounce,
);

/// Widget provide debounce function
class DebounceBuilder extends StatefulWidget {
  final DebounceTimerBuilder builder;
  final Duration? delay;

  const DebounceBuilder({
    required this.builder,
    Key? key,
    this.delay,
  }) : super(key: key);

  @override
  State<DebounceBuilder> createState() => _DebounceBuilderState();
}

class _DebounceBuilderState extends State<DebounceBuilder> {
  late DebounceTimer _timer;

  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  void _initTimer() {
    _timer = DebounceTimer(delay: widget.delay);
  }

  @override
  void dispose() {
    _timer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _timer.debounce);
  }

  @override
  void didUpdateWidget(covariant DebounceBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.delay?.inMicroseconds != widget.delay?.inMicroseconds) {
      _timer.dispose();
      _initTimer();
    }
  }
}
