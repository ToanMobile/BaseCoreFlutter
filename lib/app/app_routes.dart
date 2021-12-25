part of 'app_pages.dart';

abstract class AppRoutes {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const LOGIN_CODE = '/login_code';
  static const FORGOT_PASS = '/forgot_pass';
  static const RESET_PASS = '/reset_pass';

  //HOME
  static const HOME = '/home';
  static const PATH_DETAIL_ITEM = '/detail_item';
  static const DETAIL_ITEM = HOME + PATH_DETAIL_ITEM;
  static const NEW_ITEM = '/new_item';
  static const PATH_CATEGORY = '/category';
  static const PATH_SUB_CATEGORY = '/subcategory';
  static const PATH_COLOR = '/color';
  static const CATEGORY = NEW_ITEM + PATH_CATEGORY;
  static const SUB_CATEGORY = NEW_ITEM + PATH_SUB_CATEGORY;
  static const COLOR = NEW_ITEM + PATH_COLOR;

  //FILTER
  static const FILTER = '/filter';

  //PROFILE
  static const PROFILE = '/profile';
  static const PATH_PROFILE_EDIT = '/profile_edit';
  static const PROFILE_EDIT = PROFILE + PATH_PROFILE_EDIT;

  //FAVOURITE
  static const FAVOURITE = '/favourite';

  //CALENDAR
  static const CALENDAR = '/calendar';
  static const PATH_CALENDAR_ALARM = '/alarm';
  static const ALARM = CALENDAR + PATH_CALENDAR_ALARM;
}
