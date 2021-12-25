import 'dart:async';
import 'dart:convert';

import 'package:core/data/api/models/request/calendar_request.dart';
import 'package:core/data/api/models/response/home/core_model.dart';
import 'package:sprintf/sprintf.dart';

import '../api_constants.dart';
import 'base_service.dart';

class CalendarService extends BaseService {
  Future<List<CoreModel>> getListCalendar(int page, int pageSize) async {
    final response = await get(sprintf(GET_CALENDAR, [page, pageSize]));
    final items = List<CoreModel>.from(response.map((item) => CoreModel.fromJson(item)));
    return items;
  }

  Future<void> postCalendar(CalendarRequest calendarRequest) async {
    final postData = jsonEncode(calendarRequest.toJson());
    await post(POST_CALENDAR, data: postData);
  }

  Future<void> updateCalendar(CalendarRequest calendarRequest) async {
    final postData = jsonEncode(calendarRequest.toJson());
    await put(sprintf(UPDATE_CALENDAR, [calendarRequest.favouriteId]), data: postData);
  }

  Future<void> deleteCalendar(String id) async {
    final response = await delete(sprintf(DELETE_CALENDAR, [id]));
    return response;
  }
}
