import 'package:church_navigation/data/models/user_model.dart';
import 'package:church_navigation/data/providers/user_provider.dart';
import 'package:church_navigation/data/repositories/user_repository.dart';
import 'package:church_navigation/data/services/auth_service.dart';
import 'package:church_navigation/data/local/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:church_navigation/utils/exceptions.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = Dio();
  return AuthService(dio);
});

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return AuthNotifier(null, authService, userRepository, ref);
});

class AuthNotifier extends StateNotifier<User?> {
  final AuthService authService;
  final UserRepository userRepository;
  final Ref ref;
  AuthNotifier(super.state, this.authService, this.userRepository, this.ref);

  Future<User?> register(Map<String, dynamic> user) async {
    try {
      Map<String, dynamic> body = {
        'username': user['username'],
        'email': user['email'],
        'passwordHash': user['passwordHash'],
      };
      final newUser = await authService.registerUser(body);
      if (user['username'] == null ||
          user['email'] == null ||
          user['passwordHash'] == null) {
        throw CustomException(message: '양식을 모두 입력해주세요', statusCode: 400);
      }
      state = newUser;
      return newUser;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<String?> login(Map<String, dynamic> user) async {
    try {
      Map<String, dynamic> body = {
        'email': user['email'],
        'password': user['password'],
      };

      final token = await authService.loginUser(body);
      if (user['email'] == null || user['password'] == null) {
        throw CustomException(message: '양식을 모두 입력해주세요', statusCode: 400);
      }
      // 토큰 저장 로직
      final secureStorage = SecureStorage();
      await secureStorage.writeSecureData("authToken", token);
      return token;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<User?> getUserDetail(int id) async {
    try {
      final user = await userRepository.getUserDetail(id);
      state = user;
      return user;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> logout() async {
    // 토큰 삭제 로직
    final secureStorage = SecureStorage();
    await secureStorage.deleteSecureData("authToken");
    state = null; // 사용자 상태 null로 변경
  }
}
