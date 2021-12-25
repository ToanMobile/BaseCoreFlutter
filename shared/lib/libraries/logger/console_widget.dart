import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutter_logger.dart';
import 'log_mode.dart';
import 'logger_printer.dart';
import 'src/console_util.dart';

class ConsoleWidget extends StatefulWidget {
  ConsoleWidget({Key? key}) : super(key: key);

  @override
  _ConsoleWidgetState createState() => _ConsoleWidgetState();
}

class _ConsoleWidgetState extends State<ConsoleWidget> {
  static const int _logAll = 0;
  static const int _logOnlyFile = 1;
  static const int _logOnlyTime = 2;

  late ScrollController _controller;

  late TextSelectionControls _selectionControl;

  late TextEditingController _textController;
  static const int _levelDefault = -1;

  String _filterStr = "";

  int _logLevel = _levelDefault;

  int _logStyle = 0;

  bool _isLarge = false;

  String _levelName = "all";

  double _marginTop = 0;

  final double _mangerSize = 50;

  final GlobalKey _globalKey = GlobalKey();
  final GlobalKey _globalForDrag = GlobalKey();

  double _currendDy = 0;

  @override
  void initState() {
    _controller = ScrollController();
    _selectionControl = MaterialTextSelectionControls();
    _textController = TextEditingController();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      RenderBox renderObject =
          _globalKey.currentContext?.findRenderObject() as RenderBox;
      _currendDy = renderObject.localToGlobal(Offset.zero).dy;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDraggable();
  }

  Widget _buildDraggable() {
    return LayoutBuilder(builder: (context, constraints) {
      if (_marginTop <= 0) {
        _marginTop = 0;
      }
      return SingleChildScrollView(
        child: Container(
          key: _globalKey,
          margin: EdgeInsets.only(top: _marginTop),
          child: Draggable(
            axis: Axis.vertical,
            child: _buildDragView(constraints),
            // _isLarge 的状态下，不准拖动
            feedback: _isLarge ? Container() : _buildDragView(constraints),
            childWhenDragging:
                _isLarge ? _buildDragView(constraints) : Container(),
            onDragEnd: (DraggableDetails details) {
              _calculatePosition(details);
            },
          ),
        ),
      );
    });
  }

  /// 计算位置
  void _calculatePosition(DraggableDetails details) {
    if (!_isLarge) {
      if (mounted) {
        setState(() {
          _closeKeyBoard();
          double offY = 0;
          if ((details.offset.dy - _currendDy) < 0) {
            offY = 0;
          } else {
            offY = details.offset.dy - _currendDy;
          }
          _marginTop = offY;
        });
      }
    }
  }

  Widget _buildDragView(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      key:_globalForDrag,
      height: _isLarge
          ? constraints.maxHeight - 100 + _mangerSize
          : 200 + _mangerSize,
      // 因为滑动的时候 不知道为啥 说  IconButton 需要 Material，暂时不知道，所以加了 Scaffold
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: _isLarge ? constraints.maxHeight - 100 : 200,
              color: Colors.black,
              width: constraints.maxWidth,
              child: ValueListenableBuilder<LogModeValue>(
                valueListenable: Logger.notifier,
                builder: (_, model, child) {
                  return _buildLogWidget(model);
                },
              ),
            ),
            Container(
              height: _mangerSize,
              width: constraints.maxWidth,
              color: Colors.black26,
              child: Row(
                children: [
                  IconButton(
                    onPressed: _clearLog,
                    icon: const Icon(Icons.clear),
                  ),
                  IconButton(
                    onPressed: _changeStyle,
                    icon: const Icon(Icons.style),
                  ),
                  IconButton(
                    onPressed: _showCupertinoActionSheet,
                    icon: const Icon(Icons.print),
                  ),
                  Text(
                    _levelName,
                    style:
                        TextStyle(color: ConsoleUtil.getLevelColor(_logLevel)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: _buildTextFiled(),
                  ),
                  IconButton(
                    onPressed: _changeSize,
                    icon: Icon(
                        _isLarge ? Icons.crop : Icons.aspect_ratio_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildLogWidget(LogModeValue model) {
    List<LogMode> modeList = model.logModeList;
    List<LogMode> fiterList = [];
    for (int i = modeList.length - 1; i >= 0; i--) {
      LogMode logMode = modeList[i];
      // 过滤日志
      if ((_logLevel == logMode.level || _logLevel == _levelDefault) &&
          logMode.logMessage != null &&
          logMode.logMessage!.contains(_filterStr)) {
        fiterList.add(logMode);
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 2500,
        child: ListView.builder(
          controller: _controller,
          reverse: true,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            LogMode logMode = fiterList[index];
            TextStyle _logStyle = TextStyle(
                color: ConsoleUtil.getLevelColor(logMode.level),
                fontSize: 15,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400);
            String log = _getLog(logMode);
            return Text(log, style: _logStyle);
          },
          itemCount: fiterList.length,
        ),
      ),
    );
  }

  /// 清除日志
  void _clearLog() {
    _closeKeyBoard();
    Logger.notifier.value = LogModeValue();
  }

  /// 设置log样式，是否显示时间，是否显示文件名
  void _changeStyle() {
    if (mounted) {
      setState(() {
        _logStyle++;
      });
    }
  }

  /// 过滤日志
  Future _showCupertinoActionSheet() async {
    var result = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: const Text('提示'),
            message: const Text('选择过滤日志级别？'),
            actions: [
              CupertinoActionSheetAction(
                child: const Text('清除过滤'),
                onPressed: () {
                  filterLog(context, _levelDefault);
                },
                isDefaultAction: _logLevel != _levelDefault,
                isDestructiveAction: _logLevel == _levelDefault,
              ),
              CupertinoActionSheetAction(
                child: const Text('verbose'),
                onPressed: () {
                  filterLog(context, LoggerPrinter.verbose);
                },
                isDefaultAction: _logLevel != LoggerPrinter.verbose,
                isDestructiveAction: _logLevel == LoggerPrinter.verbose,
              ),
              CupertinoActionSheetAction(
                child: const Text('debug'),
                onPressed: () {
                  filterLog(context, LoggerPrinter.debug);
                },
                isDefaultAction: _logLevel != LoggerPrinter.debug,
                isDestructiveAction: _logLevel == LoggerPrinter.debug,
              ),
              CupertinoActionSheetAction(
                child: const Text('info'),
                onPressed: () {
                  filterLog(context, LoggerPrinter.info);
                },
                isDefaultAction: _logLevel != LoggerPrinter.info,
                isDestructiveAction: _logLevel == LoggerPrinter.info,
              ),
              CupertinoActionSheetAction(
                child: const Text('warn'),
                onPressed: () {
                  filterLog(context, LoggerPrinter.warn);
                },
                isDefaultAction: _logLevel != LoggerPrinter.warn,
                isDestructiveAction: _logLevel == LoggerPrinter.warn,
              ),
              CupertinoActionSheetAction(
                child: const Text('error'),
                onPressed: () {
                  filterLog(context, LoggerPrinter.error);
                },
                isDestructiveAction: _logLevel == LoggerPrinter.error,
                isDefaultAction: _logLevel != LoggerPrinter.error,
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop('cancel');
              },
            ),
          );
        });
  }

  /// 过滤log
  void filterLog(BuildContext context, int level) {
    if (mounted) {
      _closeKeyBoard();
      setState(() {
        _logLevel = level;
        _setLevelName();
      });
    }
    Navigator.of(context).pop('delete');
  }

  /// 更改大小
  void _changeSize() {
    if (mounted) {
      setState(() {
        _closeKeyBoard();
        _isLarge = !_isLarge;
        // 如果是 大 的情况，直接让 top 设置为 0；
        if (_isLarge) {
          _marginTop = 0;
        }
        _setLevelName();
      });
    }
  }

  /// 得到当前的名字
  void _setLevelName() {
    switch (_logLevel) {
      case _levelDefault:
        _levelName = "all";
        break;
      case LoggerPrinter.verbose:
        _levelName = "verbose";
        break;
      case LoggerPrinter.debug:
        _levelName = "debug";
        break;
      case LoggerPrinter.info:
        _levelName = "info";
        break;
      case LoggerPrinter.warn:
        _levelName = "warn";
        break;
      case LoggerPrinter.error:
        _levelName = "error";
        break;
    }
  }

  Widget _buildTextFiled() {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        autofocus: false,
        controller: _textController,
        onChanged: (value) {
          _filterText(value);
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "过滤日志",
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _textController.clear();
              _filterText("");
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  /// 过滤log
  void _filterText(String value) {
    setState(() {
      _filterStr = value;
    });
  }

  /// 关闭软键盘，并且取消焦点
  void _closeKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// 样式
  String _getLog(LogMode logMode) {
    String log = logMode.logMessage??"";
    switch (_logStyle % 3) {
      case _logAll:
        log = logMode.logMessage??"";
        break;
      case _logOnlyFile:
        log = log.replaceAll(logMode.fileName??"","");
        break;
      case _logOnlyTime:
        log = log.replaceAll(logMode.time??"","");
        break;
    }

    // print(log);
    return log;
  }


}
