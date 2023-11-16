// person.dart
import 'package:hive/hive.dart';
import 'package:task_08/constants/common_keys.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String avatar;

  Person({required this.name, required this.avatar});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json[CommonKeys.FIRST_NAME] as String? ?? '',
      avatar: json[CommonKeys.AVATAR] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CommonKeys.FIRST_NAME: name,
      CommonKeys.AVATAR: avatar,
    };
  }
}
