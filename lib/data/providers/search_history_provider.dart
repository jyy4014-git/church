import 'package:church_navigation/data/repositories/search_history_repository.dart';
import 'package:church_navigation/data/services/church_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchHistoryRepositoryProvider = Provider<SearchHistoryRepository>((
  ref,
) {
  final dio = Dio();
  final churchApiService = ChurchApiService(dio);
  return SearchHistoryRepository(churchApiService);
});

final searchProvider = FutureProvider.family<Map<String, dynamic>, String>((
  ref,
  query,
) async {
  try {
    final searchHistoryRepository = ref.watch(searchHistoryRepositoryProvider);
    return searchHistoryRepository.search(query);
  } catch (e) {
    rethrow;
  }
});
