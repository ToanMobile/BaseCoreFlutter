// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class AppRoutes {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const LOGIN_CODE = '/login_code';
  static const FORGOT_PASS = '/forgot_pass';
  static const RESET_PASS = '/reset_pass';

  //CAPTURE
  static const CAPTURE_VIN = '/capture_vin';

  //DOCUMENT
  static const DOCUMENT = '/document';
  static const UPLOAD_DOCUMENT = '/upload_document';

  //REQUEST
  static const REQUEST_VIN_ID = '/request_vin_id';
  static const REQUEST_LISENCE = '/request_lisence';
  static const REQUEST_INSURANCE = '/request_insurance';
  static const REQUEST_CUSTOMER = '/request_customer';

  //DASHBOARD
  static const CONTROLLER_DASHBOARD = '/dash_board_controller';

  //NOTIFICATION
  static const NOTIFICATION = '/notification';

  //ESTIMATION
  static const ESTIMATION_REQUEST = '/estimation_request';
  static const ESTIMATION_LIST = '/estimation_list';

  //HOME
  static const HOME = '/home';
  static const DASHBOARD = '/dash_board';
  static const TASK = '/task';
  static const CUSTOMER = '/customer';
  static const SETTING = '/setting';
  static const FIND_SURVEY = '/find_survey';
  static const PATH_DETAIL_ITEM = '/detail_item';
}
