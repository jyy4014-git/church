import 'package:church_navigation/data/repositories/pathway_repository.dart';
import 'package:church_navigation/data/services/church_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pathwayRepositoryProvider = Provider<PathwayRepository>((ref) {
  final dio = Dio();
  final churchApiService = ChurchApiService(dio);
  return PathwayRepository(churchApiService);
});
