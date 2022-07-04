import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/style.dart';
import '../../../share/util/date_time_utils.dart';

class CountDownTimerWidget extends StatefulWidget {
  final int start;
  final int end;
  final RxBool isCount;
  final TextStyle? textStyle;
  final Function? endCountDown;

  CountDownTimerWidget({required this.start, this.end = 0, required this.isCount, this.textStyle, this.endCountDown});

  @override
  State<StatefulWidget> createState() => _CountDownTimerWidgetState();
}

class _CountDownTimerWidgetState extends State<CountDownTimerWidget> {
  late Timer _timer;
  int _start = 0;

  @override
  void initState() {
    super.initState();
    _start = widget.start;
    widget.isCount.listenAndPump((event) {
      if (event) startTimer();
    });
    if (widget.isCount.value) startTimer();
  }

  void startTimer() {
    _start = widget.start;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start == widget.end) {
            timer.cancel();
            if (widget.endCountDown != null) widget.endCountDown!();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTimeOfDuration(_start),
      style: widget.textStyle ?? text16.textGreyColor,
    );
  }
}
