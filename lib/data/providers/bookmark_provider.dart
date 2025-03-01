import 'package:church_navigation/utils/exceptions.dart';
import 'package:church_navigation/data/repositories/bookmark_repository.dart';
import 'package:church_navigation/data/services/church_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookmarkRepositoryProvider = Provider<BookmarkRepository>((ref) {
  final dio = Dio();
  final churchApiService = ChurchApiService(dio);
  return BookmarkRepository(churchApiService);
});

final addBookmarkProvider =
    FutureProvider.family<Map<String, dynamic>, Map<String, dynamic>>((
      ref,
      data,
    ) async {
      try {
        final bookmarkRepository = ref.watch(bookmarkRepositoryProvider);
        final id = data['id'] as int;
        final userId = data['user_id'] as int;

        if (userId == null || id == null) {
          throw CustomException(message: '양식을 모두 입력해주세요', statusCode: 400);
        }

        return bookmarkRepository.addBookmark(id, userId);
      } catch (e) {
        rethrow;
      }
    });
