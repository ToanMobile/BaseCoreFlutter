import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/style.dart';

class WheelListPickerWidget extends StatelessWidget {
  final int? initItemIndex;
  final List<String> items;
  final Function(int)? onSelectedItemChanged;

  WheelListPickerWidget({required this.items, this.initItemIndex, this.onSelectedItemChanged});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      scrollController: FixedExtentScrollController(initialItem: initItemIndex ?? 0),
      itemExtent: 50,
      onSelectedItemChanged: (index) {
        if (onSelectedItemChanged != null) onSelectedItemChanged!(index);
      },
      children: items
          .map((item) => Center(
                child: Text(
                  item,
                  style: text18.textBlackColor,
                  textAlign: TextAlign.center,
                ),
              ))
          .toList(),
    );
  }
}

class NormalListPickerWidget extends StatefulWidget {
  int initItemIndex;
  final List<String> items;
  final Function(int)? onSelectedItemChanged;

  NormalListPickerWidget({required this.items, this.initItemIndex = -1, this.onSelectedItemChanged});

  @override
  _NormalListPickerWidgetState createState() => _NormalListPickerWidgetState();
}

class _NormalListPickerWidgetState extends State<NormalListPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        controller: ScrollController(initialScrollOffset: widget.initItemIndex != -1 && widget.initItemIndex != 0 ? widget.initItemIndex * 51.0 - 22 : 0.0),
        itemBuilder: (context, index) {
          return _buildItem(widget.items[index], index, context);
        });
  }

  Widget _buildItem(String item, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.initItemIndex = index;
          if (widget.onSelectedItemChanged != null) widget.onSelectedItemChanged!(index);
        });
      },
      child: Container(
        height: 51,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.initItemIndex == index ? getColor().themePrimaryColor : getColor().themeWhiteColor,
          border: Border(bottom: BorderSide(color: getColor().onPrimary, width: 0.75)),
        ),
        child: Text(
          item,
          style: widget.initItemIndex == index ? text14.textPrimaryColor : text14.textGreyColor,
        ),
      ),
    );
  }
}

class SogiescsListPickerWidget extends StatefulWidget {
  final List<String>? initItemIndex;
  final List<String> items;
  final Function(int)? onSelectedItemChanged;

  SogiescsListPickerWidget({required this.items, this.initItemIndex, this.onSelectedItemChanged});

  @override
  _SogiescsListPickerWidgetState createState() => _SogiescsListPickerWidgetState();
}

class _SogiescsListPickerWidgetState extends State<SogiescsListPickerWidget> {
  List<String> listInitial = [];

  @override
  void initState() {
    super.initState();
    if (widget.initItemIndex?.isNotEmpty == true) listInitial = List.from(widget.initItemIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        controller: ScrollController(initialScrollOffset: listInitial.isNotEmpty == true ? widget.items.indexOf(listInitial[0]) * 51.0 - 22 : 0.0),
        itemBuilder: (context, index) {
          return _buildItem(widget.items[index], index, context);
        });
  }

  Widget _buildItem(String item, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.onSelectedItemChanged != null) widget.onSelectedItemChanged!(index);
          if (listInitial.contains(item)) {
            listInitial.removeAt(listInitial.indexOf(item));
          } else {
            listInitial.add(item);
          }
        });
      },
      child: Container(
        height: 51,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: listInitial.contains(item) ? getColor().themePrimaryColor : getColor().themeWhiteColor,
          border: Border(bottom: BorderSide(color: getColor().themePrimaryColor, width: 0.75)),
        ),
        child: Text(
          item,
          style: listInitial.contains(item) ? text14.textPrimaryColor : text14.textGreyColor,
        ),
      ),
    );
  }
}
