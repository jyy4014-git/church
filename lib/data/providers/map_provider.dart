import 'package:church_navigation/data/repositories/church_map_repository.dart';
import 'package:church_navigation/data/services/church_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final churchMapRepositoryProvider = Provider<ChurchMapRepository>((ref) {
  final dio = Dio();
  final churchApiService = ChurchApiService(dio);
  return ChurchMapRepository(churchApiService);
});

final mapDataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  try {
    final churchMapRepository = ref.watch(churchMapRepositoryProvider);
    return churchMapRepository.getMapData();
  } catch (e) {
    rethrow;
  }
});
