import 'package:church_navigation/data/models/user_model.dart';
import 'package:church_navigation/data/services/auth_service.dart';
import 'package:church_navigation/utils/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:church_navigation/data/services/church_api_service.dart';

class UserRepository {
  final AuthService _authService;
  UserRepository(this._authService);

  Future<User> getUserDetail(int id) async {
    try {
      // throw UnimplementedError();
      // 아직 서버에서 유저 정보를 받아오는 api 가 없기 때문에, 임시적으로 만듭니다.
      return User(
        id: 1,
        username: 'test',
        email: 'test@test.com',
        passwordHash: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } on CustomException catch (e) {
      debugPrint('Custom Exception: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }
  }
}
