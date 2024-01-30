import 'package:home_widget/home_widget.dart';
import 'package:task_08/constants/common_keys.dart';
import 'package:task_08/models/userModel/person.dart';

class DataManager {
  Future addDataToWidget(Person person) async {
    await HomeWidget.saveWidgetData<String>(
        CommonKeys.WIDGET_NAME_KEY, person.name);
    await HomeWidget.updateWidget(
      name: CommonKeys.WIDGET_PROVIDER,
    );
  }
}
