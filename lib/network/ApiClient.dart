import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../core/globals.dart';
import 'DataModels/data_model.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/v3/c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf")
  @FormUrlEncoded()
  Future<DataModel> getData();
}
