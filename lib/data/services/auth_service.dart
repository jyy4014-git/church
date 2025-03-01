import 'dart:async';

import 'package:church_navigation/data/models/user_model.dart';
import 'package:church_navigation/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter/foundation.dart';
import 'package:church_navigation/utils/exceptions.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: AppConstants.authBaseUrl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("/auth/register")
  Future<User> registerUser(@Body() Map<String, dynamic> body);

  @POST("/auth/login")
  Future<String> loginUser(@Body() Map<String, dynamic> body);
}
