const DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
const DATE_TIME_FORMAT2 = "dd/MM/yyyy HH:mm";
const DATE_TIME_FORMAT3 = "yyyy-MM-dd HH:mm:ss";
const DATE_FORMAT = "dd/MM/yyyy";
const TIME_FORMAT = "HH:mm";
final minDate = DateTime(1900, 1, 1, 0, 0, 0);
final maxDate = DateTime(3000, 1, 1, 0, 0, 0);
const MIN_YEAR_OLD_USED_APP = 18;
const PAGE = 1;
const PAGE_SIZE = 50;

const PATTERN_PASSWORD_SPECIAL = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';

const PATTERN_PASSWORD = r'^(?=.*?[A-Z]).{6,}$';

const PATTERN_PHONE = r'(^(?:[+0]9)?[0-9]{10}$)';

const PATTERN_NUMBER = r'^-?[0-9]+$';
