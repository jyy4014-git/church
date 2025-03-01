import 'package:church_navigation/data/services/church_api_service.dart';
import 'package:church_navigation/utils/exceptions.dart';
import 'package:flutter/foundation.dart';

class ChurchMapRepository {
  final ChurchApiService _apiService;

  ChurchMapRepository(this._apiService);

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
}
