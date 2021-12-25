import 'package:core/data/storage/key_constant.dart';

import 'core_model.dart';

class DetailArgument{
  HOME_TAB? category;
  CoreModel? item;

  DetailArgument({required this.category, this.item});

  @override
  String toString() {
    return 'DetailArgument{category: $category, item: $item}';
  }
}