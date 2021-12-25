import 'package:core/res/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/constant/constant.dart';
import 'package:shared/util/date_time_utils.dart';

class CustomDateTimeView extends StatefulWidget {
  final String hint;
  final String header;
  final TextStyle textTextStyle;
  final TextStyle hintTextStyle;
  final Function(DateTime)? onChooseDateTime;
  final double? radius;
  final double? width;
  final double? height;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialDateTime;
  final bool enable;
  final CupertinoDatePickerMode? mode;

  CustomDateTimeView(
      {required this.hint,
      required this.header,
      required this.textTextStyle,
      required this.hintTextStyle,
      this.onChooseDateTime,
      this.radius = 5,
      this.width = 120,
      this.height = 40,
      this.minimumDate,
      this.maximumDate,
      this.initialDateTime,
      this.enable = true,
      this.mode = CupertinoDatePickerMode.date});

  @override
  State<StatefulWidget> createState() => _CustomDateTimeViewSate();
}

class _CustomDateTimeViewSate extends State<CustomDateTimeView> {
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = widget.initialDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: widget.width!,
          height: widget.height!,
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          decoration: BoxDecoration(
              color: getColor().onPrimary,
              borderRadius: BorderRadius.all(Radius.circular(widget.radius!)),
              border: Border.all(
                  color: getColor().onPrimary,
                  width: 1,
                  style: BorderStyle.solid)),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateTime != null ? getDateTimeTitle() : widget.hint,
                style: dateTime != null
                    ? widget.textTextStyle
                    : widget.hintTextStyle,
              ),
              Image.asset(
                DPath.imagesImgIcDown,
                width: 20.w,
                height: 20.w,
              )
            ],
          )),
      onTap: () {
        if (widget.enable) showBottonSheet();
      },
    );
  }

  String getDateTimeTitle() {
    if (widget.mode == CupertinoDatePickerMode.date) {
      return formatDate(dateTime)!;
    } else if (widget.mode == CupertinoDatePickerMode.dateAndTime) {
      return formatDate(dateTime, DATE_TIME_FORMAT)!;
    } else {
      return formatDate(dateTime, TIME_FORMAT)!;
    }
  }

  showBottonSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => content(),
      backgroundColor: getColor().themeWhiteColor,
    );
  }

  Widget content() {
    return Container(
        height: 300.w,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 50.w,
              padding: EdgeInsets.only(right: 16.w),
              color: getColor().themePrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        color: getColor().themeWhiteColor,
                      )),
                  Text(
                    "Ngày sinh",
                    style: text16.bold.textWhiteColor,
                  ),
                  InkWell(
                    child: Text(
                      "Chọn",
                      style: text16.bold.textWhiteColor,
                    ),
                    onTap: () {
                      setState(() {
                        if (dateTime == null) dateTime = DateTime.now();
                        if (widget.onChooseDateTime != null)
                          widget.onChooseDateTime!(dateTime!);
                      });
                      Get.back();
                    },
                  )
                ],
              ),
            ),
            Container(
                height: 250.w,
                child: CupertinoDatePicker(
                    mode: widget.mode ?? CupertinoDatePickerMode.date,
                    onDateTimeChanged: (date) {
                      dateTime = date;
                    },
                    initialDateTime: dateTime,
                    minimumDate: widget.minimumDate,
                    use24hFormat: true,
                    maximumDate: widget.maximumDate)),
          ],
        ));
  }
}
