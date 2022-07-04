import 'package:flutter/material.dart';

import '../base/base_page.dart';
import '../base/base_scaffold.dart';
import '../setting/settings_controller.dart';

class TaskPage extends BasePage<SettingsController> {
  @override
  Widget buildContentView(BuildContext context, SettingsController controller) {
    return const BaseScaffold(
      isPaddingDefault: false,
      body: Center(child: Text('TaskPage')),
    );
  }
}
