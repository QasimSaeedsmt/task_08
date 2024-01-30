import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_08/constants/constant_resources.dart';

import '../../models/userModel/person.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ConstantsResources.BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ConstantsResources.END_POINT)
  Future<List<Person>> getData();
}
