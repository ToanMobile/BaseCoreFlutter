// ignore_for_file: constant_identifier_names, camel_case_types

enum UploadDirName { POST, AVATAR, BACKGROUND }

enum DOCUMENT_TYPE { OWNER_SHIP, ROAD_TAX, OTHER }

enum STEP_TYPE { DRAFT, STEP1, STEP2, LAST }

enum VIN_TYPE { VIN_ID, FRONT, REAR, LEFT, RIGHT, WHELL, ODOMETER }

enum SELLING_TYPE { TRADE_IN_NC, TRADE_IN_UC, SELLING_ONLY }

enum STATUS_TYPE { DRAFT, PROGRESS, SOLD, ARCHIVED }

enum ESTIMATOR_TYPE { BUSY, FREE }

enum PRICE_TYPE { BOUGHT_PRICE, OFFER_PRICE, PRICE_ML }

extension UploadDirNameExt on UploadDirName {
  String get name {
    switch (this) {
      case UploadDirName.POST:
        return 'post';
      case UploadDirName.AVATAR:
        return 'avatar';
      case UploadDirName.BACKGROUND:
        return 'background';
      default:
        return '';
    }
  }
}

extension StepNameExt on STEP_TYPE {
  String get name {
    switch (this) {
      case STEP_TYPE.DRAFT:
        return 'create-draft';
      case STEP_TYPE.STEP1:
        return 'step-1';
      case STEP_TYPE.STEP2:
        return 'step-2';
      case STEP_TYPE.LAST:
        return 'last';
      default:
        return '';
    }
  }
}

extension UploadVinNameExt on VIN_TYPE {
  String get name {
    switch (this) {
      case VIN_TYPE.VIN_ID:
        return 'vin-id-photo';
      case VIN_TYPE.FRONT:
        return 'front-photo';
      case VIN_TYPE.REAR:
        return 'rear-photo';
      case VIN_TYPE.LEFT:
        return 'left-photo';
      case VIN_TYPE.RIGHT:
        return 'right-photo';
      case VIN_TYPE.WHELL:
        return 'steering-wheel-photo';
      case VIN_TYPE.ODOMETER:
        return 'odometer-photo';
      default:
        return 'other-photo';
    }
  }
}

extension UploadDocumentNameExt on DOCUMENT_TYPE {
  String get name {
    switch (this) {
      case DOCUMENT_TYPE.OWNER_SHIP:
        return 'vehicle-ownership';
      case DOCUMENT_TYPE.ROAD_TAX:
        return 'road-tax';
      case DOCUMENT_TYPE.OTHER:
        return 'other-document';
      default:
        return 'other-document';
    }
  }
}

extension SellingNameExt on SELLING_TYPE {
  String get name {
    switch (this) {
      case SELLING_TYPE.TRADE_IN_NC:
        return 'trade-in-nc';
      case SELLING_TYPE.TRADE_IN_UC:
        return 'trade-in-uc';
      case SELLING_TYPE.SELLING_ONLY:
        return 'sell-only';
      default:
        return 'sell-only';
    }
  }
}

extension SellingTypeExt on String {
  SELLING_TYPE get name {
    switch (this) {
      case 'trade-in-nc':
        return SELLING_TYPE.TRADE_IN_NC;
      case 'trade-in-uc':
        return SELLING_TYPE.TRADE_IN_UC;
      case 'sell-only':
        return SELLING_TYPE.SELLING_ONLY;
      default:
        return SELLING_TYPE.SELLING_ONLY;
    }
  }
}

extension StatusNameExt on STATUS_TYPE {
  String get name {
    switch (this) {
      case STATUS_TYPE.DRAFT:
        return 'draft';
      case STATUS_TYPE.PROGRESS:
        return 'in-progress';
      case STATUS_TYPE.SOLD:
        return 'sold';
      case STATUS_TYPE.ARCHIVED:
        return 'archived';
      default:
        return 'draft';
    }
  }
}

extension EstimatorNameExt on ESTIMATOR_TYPE {
  String get name {
    switch (this) {
      case ESTIMATOR_TYPE.BUSY:
        return 'busy';
      case ESTIMATOR_TYPE.FREE:
        return 'free';
      default:
        return 'free';
    }
  }
}
