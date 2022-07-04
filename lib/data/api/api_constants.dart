// ignore_for_file: constant_identifier_names

const BASE_URL_DEV = "https://tradein-api-dev.itads.io/";
const UPLOAD_PHOTO_URL_DEV = "https://tradein-api-dev.itads.io/";
const BASE_URL_PHOTO_DEV = "https://tradein-api-dev.itads.io/";

//Production
const BASE_URL_PROD = "https://tradein-api-dev.itads.io/"; // production
const UPLOAD_PHOTO_URL_PROD = "https://tradein-api-dev.itads.io/"; //production
const BASE_URL_PHOTO_PRO = "https://tradein-api-dev.itads.io/"; // production

String PHOTO_URL = "";
String? UPLOAD_PHOTO_URL;

class EnvironmentConfig {
  static const APP_NAME = String.fromEnvironment('DEFINE_APP_NAME', defaultValue: 'awesomeApp');
  static const APP_SUFFIX = String.fromEnvironment('DEFINE_APP_SUFFIX', defaultValue: '');
}

const pageAndSize = "?page=%s&perPage=%s";
const pageSizeAndFilter = "?page=%s&perPage=%s&filter=%s";

//Login
const LOGIN = "/auth/token";
const REGISTER = "/auth/register";
const LOG_OUT = "/auth/logout";
//Profile
const GET_PROFILE = "/users/me";
const UPLOAD_VIN_ID = "/files/upload/files";
const UPLOAD_MEDIA = "/files/upload/media";
const UPLOAD_DOCUMENT = "/files/upload/document";
//Request
const GET_REQUEST = "/estimation-requests/%s";
const CREATE_REQUEST = "/estimation-requests";
const UPDATE_REQUEST = "/estimation-requests/%s";
const SEARCH_VEHICLES = "/vehicles/search?vinId=%s";
const GET_VEHICLES_BRAND = "/masters/vehicle-brands$pageAndSize";
const GET_VEHICLES_MODEL = "/masters/vehicle-models$pageAndSize&year=%s&hashBrandId=%s";
const GET_YEAR = "/masters/vehicle-manufacture-years?q=%s";

//Common
const GET_PROVINCES = "/provinces";
const GET_INSURANCE_COMPANY = "/insurances/companies";
const GET_INSURANCE_TYPE = "/insurances/types";

//Other
const GET_NOTIFICATION = "/users/me/notifications";
const GET_ESTIMATOR = "/estimators";
const GET_ESTIMATION = "/estimation-requests$pageAndSize&status=%s";

//Archive
const POST_ARCHIVE = "estimation-requests/%s/archive";
const POST_ACCEPT = "estimation-requests/%s/accept-suggestion-price";
