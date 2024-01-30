import 'package:dio/dio.dart';
import 'package:task_08/constants/constant_resources.dart';

import '../models/userModel/person.dart';
import 'hive_db.dart';

class DioClient {
  static Dio init() {
    final Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          Map<String, dynamic> responseData = response.data;

          List<dynamic> personsData =
              responseData[ConstantsResources.PERSONS_DATA];
          List<Person> persons =
              personsData.map((data) => Person.fromJson(data)).toList();

          await HiveDB.addPersons(persons);
        },
      ),
    );
    return dio;
  }
}
