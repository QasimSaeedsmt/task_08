import 'package:hive_flutter/adapters.dart';
import 'package:task_08/constants/constant_resources.dart';

import '../models/userModel/person.dart';

class HiveDB {
  static late Box<Person> _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());
    _box = await Hive.openBox<Person>(ConstantsResources.HIVE_BOX_NAME);
  }

  static Box<Person> get box => _box;

  static Future<void> addPersons(List<Person> persons) async {
    if (!box.isOpen) {
      await init();
    }

    await box.clear();

    await box.addAll(persons);
  }
}
