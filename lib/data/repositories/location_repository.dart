import 'package:church_navigation/data/models/location_model.dart';
import 'package:church_navigation/data/services/church_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:church_navigation/utils/exceptions.dart';

class LocationRepository {
  final ChurchApiService _apiService;

  LocationRepository(this._apiService);

  Future<Map<String, dynamic>> getMapData({
    String? search,
    String? category,
  }) async {
    try {
      return await _apiService.getMapData(search: search, category: category);
    } on CustomException catch (e) {
      debugPrint('Custom Exception: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }
  }

  Future<Location> getLocationDetail(int id) async {
    try {
      return await _apiService.getLocationDetail(id);
    } on CustomException catch (e) {
      debugPrint('Custom Exception: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }
  }
}
