import 'package:church_navigation/data/models/user_model.dart';
import 'package:church_navigation/data/repositories/user_repository.dart';
import 'package:church_navigation/data/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = Dio();
  final authService = AuthService(dio);
  return UserRepository(authService);
});

final userDetailProvider = FutureProvider.family<User, int>((ref, id) async {
  try {
    final userRepository = ref.watch(userRepositoryProvider);
    return userRepository.getUserDetail(id);
  } catch (e) {
    rethrow;
  }
});
