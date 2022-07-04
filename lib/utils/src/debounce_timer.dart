import 'dart:async';
import 'dart:ui';

/// Use for create new instance debounce timer, don`t forget call dispose
/// for close instance.
///
/// [delay] - delay time, default value is 300 milliseconds
class DebounceTimer {
  final Duration? delay;

  Timer? _timer;

  DebounceTimer({this.delay});

  /// Wait time, and call callback when time is elapsed
  void debounce(VoidCallback callback) {
    if (_timer?.isActive == true) _timer!.cancel();
    _timer = Timer(delay ?? const Duration(milliseconds: 300), () {
      _timer!.cancel();
      callback();
    });
  }

  /// Cancel timer, use necessary for prevent memory leaks
  void dispose() {
    _timer?.cancel();
  }
}
