import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hsinote/exception/cache_exception.dart';
import 'package:hsinote/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ulid/ulid.dart';

abstract class UserLocalService {
  Future<UserModel> login({required String email, required String password});

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel?> user();

  Future<bool> logout();
}

class UserLocalServiceImpl implements UserLocalService {
  UserLocalServiceImpl();

  Future<Box> get _box async {
    final path = await getTemporaryDirectory();

    Hive.init(path.path);

    return await Hive.openBox('user');
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final box = await _box;

      final data = await box.get(email);

      if (data != null && data is String) {
        final user = UserModel.fromJson(jsonDecode(data));

        if (user.password != password) {
          throw CacheException('Incorrect email or password.');
        }

        await box.put('authentication', email);

        return user;
      } else {
        throw CacheException('This email address is not registered.');
      }
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final ulid = Ulid().toString();

      final data = UserModel(
        id: ulid,
        name: name,
        email: email,
        password: password,
      );

      final box = await _box;

      await box.put(email, jsonEncode(data.toJson()));

      await box.put('authentication', email);

      return data;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<UserModel?> user() async {
    try {
      final box = await _box;

      final token = await box.get('authentication');

      if (token != null && token is String) {
        final data = await box.get(token);

        if (data != null && data is String) {
          return UserModel.fromJson(jsonDecode(data));
        }

        throw CacheException('Please register or log in to your account.');
      } else {
        throw CacheException('Please register or log in to your account.');
      }
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<bool> logout() async {
    final box = await _box;

    await box.delete('authentication');

    return true;
  }
}
