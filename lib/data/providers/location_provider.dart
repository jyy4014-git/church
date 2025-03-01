import 'package:church_navigation/data/models/location_model.dart';
import 'package:church_navigation/data/repositories/location_repository.dart';
import 'package:church_navigation/data/services/church_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  final dio = Dio();
  final churchApiService = ChurchApiService(dio);
  return LocationRepository(churchApiService);
});

final mapDataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  try {
    final locationRepository = ref.watch(locationRepositoryProvider);
    return locationRepository.getMapData();
  } catch (e) {
    rethrow;
  }
});

final locationDetailProvider = FutureProvider.family<Location, int>((
  ref,
  id,
) async {
  try {
    final locationRepository = ref.watch(locationRepositoryProvider);
    return locationRepository.getLocationDetail(id);
  } catch (e) {
    rethrow;
  }
});
