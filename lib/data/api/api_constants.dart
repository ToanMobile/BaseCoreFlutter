const BASE_URL_DEV = "BASE_URL";
const UPLOAD_PHOTO_URL_DEV = "BASE_URL";
const BASE_URL_PHOTO_DEV = "";

const BASE_URL_PROD = "BASE_URL_PRODUCTION"; // production
const UPLOAD_PHOTO_URL_PROD = "BASE_URL"; //production
const BASE_URL_PHOTO_PRO = "BASE_URL"; // production

String PHOTO_URL = "";
String? UPLOAD_PHOTO_URL;

const pageAndSize = "?page=%s&perPage=%s";
const pageSizeAndFilter = "?page=%s&perPage=%s&filter=%s";

//Login
const LOGIN = "/auth/login";
const REGISTER = "/auth/register";
const VERIFY_EMAIL = "/auth/verifyEmail";
const RESENT_CODE = "/auth/resendVerifyEmail";
const FORTGOT_PASSWORD = "/auth/forgotPassword";
const RESET_PASSWORD = "/auth/resetPassword";
const LOGIN_FACEBOOK = "/auth/facebook?access_token=";
const LOGIN_GOOGLE = "/auth/google?access_token=";
const LOG_OUT = "/auth/logout";

//Tab home
const GET_NEW_LOOK = "/new-looks";
const GET_BOUTIQUE = "/products/boutiques";
const GET_VESTIUMS = "/outfit-boutique";
const GET_PRODUCT = "/products";
const GET_VES_SET = "/ves-sets";
const GET_VES_BRAND = "/ves-brands";
const GET_BRAND_DETAILS = "/brands/%s";

//Tab favourite
const GET_FAVOURITE = "/favourites$pageAndSize";
const POST_FAVOURITE = "/favourites";
const DELETE_FAVOURITE = "/favourites/%s/%s";

//Tab calendar
const GET_CALENDAR = "/calendars$pageAndSize";
const POST_CALENDAR = "/calendars";
const UPDATE_CALENDAR = "/calendars/%s";
const DELETE_CALENDAR = "/calendars/%s";

//Setting
const GET_COLOR = "/colors/hsl-to-color?hsl=%s";

//Tab Item
const POST_PRODUCT = "/products";
const UPLOAD_IMAGE = "/upload/optimize-image";
const CATEGORY_CATEGORY = "/categories$pageSizeAndFilter";
const CATEGORY_SUB_CATEGORY = "/categories$pageSizeAndFilter";
const CATEGORY_COLOR = "/colors$pageAndSize";
const CATEGORY_COLOR_SOURCE = "/colors/sources$pageAndSize";
const CATEGORY_MATERIAL = "/material$pageAndSize";
const CATEGORY_PATTERN = "/pattern$pageAndSize";
const CATEGORY_BRAND = "/brands$pageAndSize";
const CATEGORY_THICKNESS = "/thickness$pageAndSize";
const CATEGORY_FEATURE = "/figures";

//Profile
const UPLOAD_AVATAR = "/upload/avatars";
const EDIT_PROFILE = "/auth/me";

//Filter
const GET_SEASON = "/seasons$pageSizeAndFilter";
const GET_OCCASION = "/occasions$pageAndSize";
const GET_STYLES = "/styles$pageSizeAndFilter";

//Get Details
const GET_PRODUCT_DETAILS = "/products/%s";