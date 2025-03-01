import 'dart:async';

import 'package:church_navigation/data/models/location_model.dart';
import 'package:church_navigation/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter/foundation.dart';
import 'package:church_navigation/utils/exceptions.dart';

part 'church_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ChurchApiService {
  factory ChurchApiService(Dio dio, {String baseUrl}) = _ChurchApiService;

  @GET("/church/map")
  Future<Map<String, dynamic>> getMapData({
    @Query("search") String? search,
    @Query("category") String? category,
  });

  @GET("/church/locations/{id}")
  Future<Location> getLocationDetail(@Path("id") int id);

  @POST("/church/locations/{id}/bookmark")
  @FormUrlEncoded()
  Future<Map<String, dynamic>> addBookmark(
    @Path("id") int id,
    @Field("user_id") int userId,
  );

  @GET("/church/search")
  Future<Map<String, dynamic>> search(@Query("query") String query);
}
