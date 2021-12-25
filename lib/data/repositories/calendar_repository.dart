import 'package:core/data/api/models/request/calendar_request.dart';
import 'package:core/data/api/models/response/home/core_model.dart';
import 'package:core/data/api/services/calendar_service.dart';
import 'package:get/get.dart';

import 'base_repository.dart';

class CalendarRepository extends BaseRepository {
  final _calendarService = Get.find<CalendarService>();

  Future<List<CoreModel>> getListCalendar(int page, int pageSize) async {
    final response = await _calendarService.getListCalendar(page, pageSize);
    return response;
  }

  Future<void> postCalendar(CalendarRequest calendarRequest) async {
    final response = await _calendarService.postCalendar(calendarRequest);
    return response;
  }

  Future<void> updateCalendar(CalendarRequest calendarRequest) async {
    final response = await _calendarService.updateCalendar(calendarRequest);
    return response;
  }

  Future<void> deleteCalendar(String id) async {
    final response = await _calendarService.deleteCalendar(id);
    return response;
  }
}
