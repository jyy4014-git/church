import 'package:church_navigation/data/services/church_api_service.dart';
import 'package:church_navigation/utils/exceptions.dart';
import 'package:flutter/foundation.dart';

class BookmarkRepository {
  final ChurchApiService _apiService;

  BookmarkRepository(this._apiService);

  Future<Map<String, dynamic>> addBookmark(int id, int userId) async {
    try {
      return await _apiService.addBookmark(id, userId);
    } on CustomException catch (e) {
      debugPrint('Custom Exception: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }
  }
}
